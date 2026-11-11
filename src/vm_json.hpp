#pragma once
#include "robotwar/vm.hpp"
#include "robotwar/world.hpp"
#include <nlohmann/json.hpp>
#include <vector>
#include <string>

namespace robotwar {
inline nlohmann::json vm_json(const nlohmann::json& input) {
    CpuState state;
    state.pc=input.value("pc",0);
    state.accumulator=input.value("accumulator",0);
    state.stack_pointer=input.value("sp",1);
    state.cycle_debt=input.value("surplus",0);
    state.interrupt_active=input.value("interrupt",false);
    state.num_robots=input.value("num_robots",1);
    if (input.contains("registers")) {
        const auto& regs=input.at("registers");
        if (regs.size()>state.registers.size()) throw std::invalid_argument("too many CPU registers");
        for (std::size_t i=0;i<regs.size();++i) state.registers[i]=regs[i].get<std::int16_t>();
    }
    if (input.contains("stack")) {
        const auto& stack=input.at("stack");
        if (stack.size()>state.stack.size()) throw std::invalid_argument("too many stack slots");
        for (std::size_t i=0;i<stack.size();++i) state.stack[i]=stack[i].get<std::int16_t>();
    }
    if (input.contains("memory")) {
        for (const auto& [key,value]:input.at("memory").items()) {
            const auto index=std::stoul(key);
            if (index>=state.memory.size()) throw std::invalid_argument("memory index out of range");
            state.memory[index]=value.get<std::int16_t>();
        }
    }
    std::vector<Instruction> program;
    for (const auto& row:input.at("program")) {
        if (row.size()!=3) throw std::invalid_argument("instruction must have opcode, mode and operand");
        program.push_back({row[0].get<std::uint8_t>(),row[1].get<std::uint8_t>(),row[2].get<std::int16_t>()});
    }
    struct FixtureBus final : RegisterBus {
        World world;
        CpuState& cpu_state;
        std::vector<std::int16_t> random_words;
        std::size_t random_offset{};
        explicit FixtureBus(CpuState& cpu_state,const nlohmann::json& input):cpu_state(cpu_state) {
            if(input.contains("random_words"))random_words=input.at("random_words").get<std::vector<std::int16_t>>();
            world.add_robot({},5,5);
            world.state(0).registers=cpu_state.registers;
            world.state(0).radar_result=0;
            world.state(0).radar_range=0;
        }
        void sync() {
            for (unsigned i=0;i<19;++i)
                if (i!=10 && i!=11 && i!=17 && i!=18)
                    cpu_state.registers[i]=world.state(0).registers[i];
            cpu_state.radar_result=world.state(0).radar_result;
        }
        std::int16_t read(std::uint8_t reg,std::int16_t) override {
            return world.read_register(0,reg);
        }
        RegisterWrite write(std::uint8_t reg,std::int16_t value) override {
            auto extra=world.write_register(0,reg,value);
            sync();
            return {world.state(0).registers[reg],static_cast<std::int16_t>(extra)};
        }
        std::int16_t random_word() override {
            if(random_offset>=random_words.size())throw std::out_of_range("random_words sequence exhausted");
            return random_words[random_offset++];
        }
        void raw_radar_write(std::int16_t value) override { world.state(0).radar_result=value; }
        void raw_register_write(std::uint8_t reg,std::int16_t value) override { world.state(0).registers[reg]=value; }
        void reset() override {
            auto& r=world.state(0);
            r.registers=cpu_state.registers;
            r.radar_result=-1;
            r.target_x=r.target_y=0;
        }
        void begin_slice(bool tick) override {
            auto& r=world.state(0);
            r.previous_speed=r.registers[5];r.previous_direction=r.registers[6];
            if (tick) world.begin_tick();
            r.registers[9]=static_cast<std::int16_t>(cpu_state.num_robots-1);
            sync();
        }
        void end_slice() override { world.end_cpu_slice(0);sync(); }
    } bus(state,input);
    VirtualCpu cpu;
    cpu.trace_enabled=input.value("trace_enabled",false);
    auto result=cpu.run(program,state,input.value("budget",1),&bus,input.value("tick",false));
    nlohmann::json memory=nlohmann::json::object();
    if (input.contains("watch_memory")) {
        for (const auto& entry:input.at("watch_memory")) {
            std::string key=entry.is_string() ? entry.get<std::string>() : std::to_string(entry.get<unsigned>());
            const auto index=std::stoul(key);
            if (index>=state.memory.size()) throw std::invalid_argument("watched memory index out of range");
            memory[key]=state.memory[index];
        }
    } else if (input.contains("memory")) {
        for (const auto& [key,value]:input.at("memory").items()) memory[key]=state.memory[std::stoul(key)];
    }
    return {{"pc",state.pc},{"accumulator",state.accumulator},{"sp",state.stack_pointer},
            {"surplus",state.cycle_debt},{"registers",state.registers},{"memory",memory},
            {"stack",state.stack},{"interrupt",state.interrupt_active},{"result",result.trace_break}};
}
} // namespace robotwar
