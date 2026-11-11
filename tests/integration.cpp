#include "robotwar/compiler.hpp"
#include "robotwar/simulation.hpp"
#include "robotwar/mac_math.hpp"
#include <iostream>
#include <stdexcept>

static void require(bool value, const char* message) { if(!value) throw std::runtime_error(message); }
int main() {
    using namespace robotwar;
    try {
        auto compiled=compile("allocate counter\rstart\rcounter + 1 to counter\rgoto start\r");
        require(bool(compiled), "integration robot did not compile");
        require(compiled.program.code.size()==compiled.program.source_map.size(), "source mapping lost instructions");
        Simulation simulation;
        simulation.add_robot("counter",compiled.program,50,50);
        std::size_t instructions=0;
        simulation.set_trace_sink([&](std::size_t index,const InstructionTrace&) {
            require(index==0,"trace robot identity changed"); ++instructions;
        });
        const auto before=simulation.snapshot();
        simulation.step();
        const auto after=simulation.snapshot();
        require(before.tick==0 && before.robots[0].cpu.memory[0]==0,"snapshot was mutated");
        require(after.tick==1 && instructions==100,"instruction budget or trace observer failed");
        require(after.robots[0].cpu.memory[0]==25,"compiled loop did not execute through simulation");
        require(after.robots[0].physical.registers[0]==50,"stationary robot moved");
        simulation.step();
        require(after.tick==1,"copied snapshot is not independent");
        require(simulation.snapshot().robots[0].cpu.memory[0]==50,"CPU state did not persist");
        auto shooter=compile("90 to aim\r20 to shot\rloop\rgoto loop\r");
        require(bool(shooter),"shooter did not compile");
        Simulation combat;
        combat.add_robot("shooter",shooter.program,50,50);
        combat.add_robot("target",compile("loop\rgoto loop\r").program,70,50);
        std::size_t shots=0,explosions=0;
        combat.set_event_sink([&](const WorldEvent& event) {
            if(event.kind==WorldEvent::Kind::Shot) ++shots;
            if(event.kind==WorldEvent::Kind::Explosion) ++explosions;
        });
        combat.run(10);
        require(shots==1 && explosions==1,"shot lifecycle did not deliver events");
        require(combat.snapshot().robots[1].physical.raw_damage>0,"shell failed to damage target");
        mac::QuickDrawRandom zero(0);
        bool bounded=false;
        try { World::random_placements(2,[&] { return zero(); }); }
        catch(const std::runtime_error&) { bounded=true; }
        require(bounded,"degenerate placement source was not bounded");
        std::cout << "Simulation integration: source maps, CPU state, snapshots, observers, shell events passed\n";
    } catch(const std::exception& error) { std::cerr<<error.what()<<'\n'; return 1; }
}
