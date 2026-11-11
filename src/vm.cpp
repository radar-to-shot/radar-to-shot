#include "robotwar/vm.hpp"
#include <algorithm>
#include <limits>
#include <stdexcept>

namespace robotwar {
namespace {
std::int16_t word(std::int32_t value) {
    const auto bits = static_cast<std::uint16_t>(value);
    return bits <= 0x7fff ? static_cast<std::int16_t>(bits)
                         : static_cast<std::int16_t>(static_cast<std::int32_t>(bits)-65536);
}
bool retained_register(unsigned r) {
    return r==0 || r==1 || r==3 || r==4 || r==7 || r==9;
}
}
std::int16_t RegisterBus::random_word() {
    throw std::logic_error("Random requires an injected QuickDraw random-word source");
}
void VirtualCpu::reset(CpuState& state, RegisterBus* bus) const {
    for (unsigned i=0;i<state.registers.size();++i)
        if (!retained_register(i)) state.registers[i]=0;
    state.radar_result=-1;
    state.memory.fill(0);
    state.stack_pointer=1;
    state.stack[0]=0;
    state.pc=state.accumulator=state.cycle_debt=0;
    state.interrupt_active=false;
    if (bus) bus->reset();
}
RunResult VirtualCpu::run(std::span<const Instruction> program, CpuState& state,
                         std::int16_t budget, RegisterBus* bus, bool clock_tick) const {
    if (program.empty() || program.size()>2001)
        throw std::invalid_argument("CPU program must contain 1..2001 instructions");
    if (budget>32000) throw std::invalid_argument("CPU slice budget must not exceed 32000 cycles");
    RunResult result;
    if (bus) bus->begin_slice(clock_tick);
    state.registers[9]=bus ? bus->read(9,state.registers[9]) : word(state.num_robots-1);
    if (clock_tick && !bus && state.registers[3]>0) --state.registers[3];
    auto stored_pc=state.pc, stored_accumulator=state.accumulator;
    auto stored_surplus=state.cycle_debt;
    auto clear_saved = [&] { stored_pc=stored_accumulator=stored_surplus=0; };
    auto fault = [&] { ++state.error_resets; reset(state,bus); clear_saved(); };
    auto valid_address = [&](std::int16_t address) {
        if (address<0 || static_cast<std::size_t>(address)>program.size()) {
            fault(); return false;
        }
        return true;
    };
    auto push = [&](std::int16_t value) {
        if (state.stack_pointer<0 || state.stack_pointer>=30) { fault(); return; }
        state.stack[static_cast<unsigned>(state.stack_pointer++)]=value;
    };
    auto pop = [&]() -> std::int16_t {
        if (state.stack_pointer<=1 || state.stack_pointer>30) { fault(); return 0; }
        return state.stack[static_cast<unsigned>(--state.stack_pointer)];
    };
    // Unchecked direct addressing uses a signed 16-bit indexed effective address.
    // Preserve the original aliases inside the CPU record without native OOB access.
    auto record_word = [&](std::int16_t index, bool writing, std::int16_t value) -> std::int16_t {
        const auto offset=word(static_cast<std::int32_t>(index)*2+0x1f7c);
        auto access=[&](std::int16_t& slot) { if(writing)slot=value;return slot; };
        if (offset>=0x1f7c && offset<=0x210c)
            return access(state.memory[static_cast<unsigned>((offset-0x1f7c)/2)]);
        if (offset>=0x1f56 && offset<=0x1f7a) {
            auto reg=static_cast<unsigned>((offset-0x1f56)/2);
            if(writing && bus)bus->raw_register_write(static_cast<std::uint8_t>(reg),value);
            return access(state.registers[reg]);
        }
        if(offset==0x210e)return access(stored_pc);
        if(offset==0x2110)return access(stored_surplus);
        if(offset==0x2112)return access(state.stack_pointer);
        if(offset==0x2114)return access(stored_accumulator);
        if(offset==0x2116) {
            if(writing)state.interrupt_active=(static_cast<std::uint16_t>(value)>>8)!=0;
            return state.interrupt_active?256:0;
        }
        if(offset>=0x2118 && offset<=0x2152)
            return access(state.stack[static_cast<unsigned>((offset-0x2118)/2)]);
        if(offset==0x216c) {
            if(writing && bus)bus->raw_radar_write(value);
            return access(state.radar_result);
        }
        // Negative ALLOCATE counts accepted by the original compiler can reach
        // unmodeled metadata or external Mac RAM. Reject these accesses explicitly
        // instead of invoking host undefined behavior.
        throw std::out_of_range("direct memory operand aliases an unsupported robot-record field");
    };
    auto read = [&](const Instruction& instruction) -> std::int16_t {
        const auto operand=instruction.operand;
        if (instruction.mode==1) {
            if (operand<0 || operand>18) { fault(); return 0; }
            auto reg=static_cast<unsigned>(operand);
            if (reg==18) return pop();
            if (reg==17) {
                const auto range=state.registers[17];
                if (!range) return 0;
                if (!bus) throw std::logic_error("Random read requires a RegisterBus");
                auto sample=bus->random_word();
                if (sample<0) sample=word(-static_cast<std::int32_t>(sample));
                // DIVS overflow leaves its dividend unchanged; SWAP then selects
                // the sign-extended high word (only -32768 / -1 can overflow here).
                if (sample==std::numeric_limits<std::int16_t>::min() && range==-1) return -1;
                return word(static_cast<std::int32_t>(sample)%range);
            }
            if (bus && reg!=10 && reg!=11)
                return bus->read(static_cast<std::uint8_t>(reg),state.registers[reg]);
            return reg==16 ? state.radar_result : state.registers[reg];
        }
        if (instruction.mode==4 || instruction.mode==5) {
            if (instruction.mode==4) return record_word(operand,false,0);
            const auto index=record_word(operand,false,0);
            if (index<0 || index>200) { fault(); return 0; }
            return state.memory[static_cast<unsigned>(index)];
        }
        return operand;
    };
    if (clock_tick && state.registers[10]!=0 && !state.interrupt_active) {
        const auto target=state.registers[11];
        if (valid_address(target)) {
            push(state.pc);
            state.pc=target;
            state.stack[0]=state.accumulator;
            state.interrupt_active=true;
            result.cycles=word(result.cycles+1);
        }
    }
    while (result.cycles<budget && !result.trace_break) {
        if (state.pc<0 || static_cast<std::size_t>(state.pc)>=2001) {
            fault(); // A host safety guard; original relies on compiler reset sentinel.
            result.cycles=word(result.cycles+1);
            ++result.instructions;
            continue;
        }
        const auto address=state.pc;
        const auto insn=static_cast<std::size_t>(state.pc)<program.size()
                          ? program[static_cast<std::size_t>(state.pc)] : Instruction{};
        const auto before=state.accumulator;
        const auto cycles_before=result.cycles;
        state.pc=word(state.pc+1);
        auto condition=[&](bool matches) { if (!matches) state.pc=word(state.pc+1); };
        switch (static_cast<Opcode>(insn.opcode)) {
        case Opcode::Nop: break;
        case Opcode::Load: state.accumulator=read(insn); break;
        case Opcode::Add: { const auto rhs=read(insn); state.accumulator=word(state.accumulator+rhs); break; }
        case Opcode::Subtract: { const auto rhs=read(insn); state.accumulator=word(state.accumulator-rhs); break; }
        case Opcode::Multiply: { const auto rhs=read(insn); state.accumulator=word(static_cast<std::int32_t>(state.accumulator)*rhs); break; }
        case Opcode::Divide: {
            const auto divisor=read(insn);
            if (!divisor) state.accumulator=state.accumulator>0 ? 32767 : -32767;
            else state.accumulator=word(static_cast<std::int32_t>(state.accumulator)/divisor);
            break;
        }
        case Opcode::Modulo: {
            const auto divisor=read(insn);
            if (!divisor) state.accumulator=0;
            else if (state.accumulator==std::numeric_limits<std::int16_t>::min() && divisor==-1)
                state.accumulator=-1;
            else state.accumulator=word(static_cast<std::int32_t>(state.accumulator)%divisor);
            break;
        }
        case Opcode::And: { const auto rhs=read(insn); state.accumulator=word(state.accumulator&rhs); break; }
        case Opcode::Or: { const auto rhs=read(insn); state.accumulator=word(state.accumulator|rhs); break; }
        case Opcode::Xor: { const auto rhs=read(insn); state.accumulator=word(state.accumulator^rhs); break; }
        case Opcode::Equal: { const auto rhs=read(insn); condition(state.accumulator==rhs); break; }
        case Opcode::Greater: { const auto rhs=read(insn); condition(state.accumulator>rhs); break; }
        case Opcode::Less: { const auto rhs=read(insn); condition(state.accumulator<rhs); break; }
        case Opcode::GreaterEqual: { const auto rhs=read(insn); condition(state.accumulator>=rhs); break; }
        case Opcode::LessEqual: { const auto rhs=read(insn); condition(state.accumulator<=rhs); break; }
        case Opcode::NotEqual: { const auto rhs=read(insn); condition(state.accumulator!=rhs); break; }
        case Opcode::Store:
            if (insn.mode==4 || insn.mode==5) {
                if (insn.mode==4) record_word(insn.operand,true,state.accumulator);
                else {
                    const auto index=record_word(insn.operand,false,0);
                    if (index<0 || index>200) { fault(); break; }
                    state.memory[static_cast<unsigned>(index)]=state.accumulator;
                }
            } else if (insn.mode==1) {
                const auto reg=insn.operand;
                if (reg<0 || reg>18) break;
                if (reg==18) push(state.accumulator);
                else if (reg==10 || reg==11 || reg==17)
                    state.registers[static_cast<unsigned>(reg)]=state.accumulator;
                else if (bus) {
                    const auto write=bus->write(static_cast<std::uint8_t>(reg),state.accumulator);
                    if (write.extra_cycles<0 || write.extra_cycles>50)
                        throw std::logic_error("RegisterBus extra cycle cost must be in 0..50");
                    state.registers[static_cast<unsigned>(reg)]=write.value;
                    result.cycles=word(result.cycles+write.extra_cycles);
                } else if (!retained_register(static_cast<unsigned>(reg)))
                    state.registers[static_cast<unsigned>(reg)]=state.accumulator;
            } else fault();
            break;
        case Opcode::Gosub: {
            const auto target=read(insn);
            if (valid_address(target)) { push(state.pc); state.pc=target; }
            break;
        }
        case Opcode::Goto: {
            const auto target=read(insn);
            if (valid_address(target)) state.pc=target;
            break;
        }
        case Opcode::Return: state.pc=pop(); valid_address(state.pc); break;
        case Opcode::EndInterrupt:
            state.pc=pop();
            if (valid_address(state.pc)) { state.accumulator=state.stack[0]; state.interrupt_active=false; }
            break;
        case Opcode::Trace:
            result.cycles=word(result.cycles-1);
            result.trace_break=trace_enabled;
            break;
        case Opcode::Reset:
            // The original compares the already-incremented PC with its terminal
            // instruction index, and counts terminal fall-through as a CPU reset.
            if (static_cast<std::size_t>(state.pc)>=program.size()) ++state.error_resets;
            reset(state,bus);
            clear_saved();
            break;
        default: break; // Original jump table ignores opcode bytes >= 23.
        }
        result.cycles=word(result.cycles+1);
        ++result.instructions;
        if (observer) observer({address,insn,before,state.accumulator,state.pc,
                                word(result.cycles-cycles_before)});
    }
    state.cycle_debt=word(result.cycles-budget);
    if (bus) bus->end_slice();
    return result;
}
} // namespace robotwar
