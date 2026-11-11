#include "robotwar/compiler.hpp"
#include "robotwar/vm.hpp"
#include "robotwar/world.hpp"
#include "robotwar/simulation.hpp"
#include "robotwar/mac_math.hpp"
#include "vm_json.hpp"
#include "world_json.hpp"
#include <nlohmann/json.hpp>
#include <fstream>
#include <iostream>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

using nlohmann::json;

std::string read_file(const std::string& path) {
    std::ifstream file(path, std::ios::binary);
    if (!file) throw std::runtime_error("Cannot read file: " + path);
    return {std::istreambuf_iterator<char>(file), {}};
}
json compile_json(const json& input) {
    auto result = robotwar::compile(input.at("source").get<std::string>(), input.value("debug", false));
    const auto bytes = robotwar::encode_bytecode(result.program);
    static constexpr char hex[] = "0123456789abcdef";
    std::string encoded;
    encoded.reserve(bytes.size()*2);
    for (auto byte : bytes) { encoded += hex[byte >> 4]; encoded += hex[byte & 15]; }
    json attributes=json::array();
    for (auto attribute:result.program.attributes) attributes.push_back(static_cast<std::uint16_t>(attribute));
    return {{"error", result.error ? result.error->message : ""},
            {"error_position", result.error_position},
            {"attributes", attributes},
            {"code_count", result.program.code.size()}, {"code_hex", encoded}};
}
json battle_json(const json& input) {
    // Deliberately injectable host service: placement and random seed are inputs,
    // independent of wall-clock time and of a presentation toolkit.
    robotwar::mac::QuickDrawRandom random(input.value("seed",1u));
    robotwar::Simulation simulation([&] { return random(); });
    const auto& items=input.at("robots");
    if (!items.is_array() || items.empty() || items.size()>5)
        throw std::invalid_argument("A battle needs one to five robots");
    bool explicit_positions=true, generated_positions=true;
    for(const auto& item:items) {
        explicit_positions &= item.contains("x") && item.contains("y");
        generated_positions &= !item.contains("x") && !item.contains("y");
    }
    if (!explicit_positions && !generated_positions)
        throw std::invalid_argument("Supply x and y for every robot, or omit both for every robot");
    std::vector<robotwar::WorldPlacement> placements;
    if (generated_positions)
        placements=robotwar::World::random_placements(items.size(),[&] { return random(); });
    std::size_t index=0;
    for (const auto& item: input.at("robots")) {
        auto compiled=robotwar::compile(item.at("source").get<std::string>());
        if (!compiled) throw std::invalid_argument(item.value("name",std::string("robot"))+": "+compiled.error->message);
        simulation.add_robot(item.value("name",std::string("robot")),std::move(compiled.program),
                             explicit_positions ? item.at("x").get<std::int16_t>() : placements[index].x,
                             explicit_positions ? item.at("y").get<std::int16_t>() : placements[index].y);
        ++index;
    }
    if (input.at("robots").empty()) throw std::invalid_argument("A battle needs at least one robot");
    json events=json::array();
    if (input.value("events",false)) simulation.set_event_sink([&](const robotwar::WorldEvent& event) {
        events.push_back({{"kind",static_cast<int>(event.kind)},{"tick",event.tick},
            {"robot",event.robot},{"other",event.other},{"x",event.x},{"y",event.y},{"value",event.value}});
    });
    auto ticks=input.value("ticks",1000u);
    if (ticks>1000000) throw std::invalid_argument("CLI tick limit is 1000000");
    simulation.run(ticks);
    auto snapshot=simulation.snapshot();
    json robots=json::array();
    for (const auto& robot:snapshot.robots) {
        const auto& p=robot.physical;
        robots.push_back({{"name",robot.name},{"active",p.active},{"registers",p.registers},
            {"pc",robot.cpu.pc},{"accumulator",robot.cpu.accumulator},
            {"memory",robot.cpu.memory},{"stack_pointer",robot.cpu.stack_pointer},
            {"cycle_debt",robot.cpu.cycle_debt},{"error_resets",robot.cpu.error_resets},
            {"velocity",{p.velocity_x,p.velocity_y}},{"score",p.score},
            {"raw_damage",p.raw_damage},{"shell_active",p.shell.active}});
    }
    return {{"tick",snapshot.tick},{"alive",simulation.alive()},{"robots",robots},{"events",events}};
}
json dispatch(const json& input) {
    const auto kind = input.at("kind").get<std::string>();
    if (kind == "compile") return compile_json(input);
    if (kind == "battle") return battle_json(input);
    if (kind == "parse") {
        auto t = robotwar::scan_token(input.at("source").get<std::string>(),
                                     input.value("offset",0), input.value("has_operand",false));
        return {{"kind",t.kind},{"operation",t.operation},{"attribute",t.attribute},
                {"value",t.value},{"symbol",t.symbol},{"next_offset",t.next_offset},{"error",t.error}};
    }
    if (kind == "vm") return robotwar::vm_json(input);
    if (kind.rfind("world_", 0) == 0) return robotwar::world_json(input);
    throw std::invalid_argument("Unknown operation: " + kind);
}
int main(int argc, char** argv) {
    try {
        const std::string command = argc > 1 ? argv[1] : "help";
        if (command == "jsonl") {
            for (std::string line; std::getline(std::cin, line);) {
                try { std::cout << dispatch(json::parse(line)).dump() << '\n'; }
                catch (const std::exception& error) { std::cout << json{{"exception",error.what()}}.dump() << '\n'; }
            }
            return 0;
        }
        if (command == "compile" && argc >= 3) {
            auto result = compile_json({{"source", read_file(argv[2])}, {"debug", argc > 3 && std::string(argv[3])=="--debug"}});
            std::cout << result.dump(2) << '\n';
            return result.at("error").get<std::string>().empty() ? 0 : 1;
        }
        if (command == "battle" && argc >= 3) {
            json request={{"robots",json::array()},{"ticks",1000},{"seed",1}};
            std::size_t index=0;
            for (int arg=2;arg<argc;++arg) {
                std::string option=argv[arg];
                if ((option=="--ticks" || option=="--seed") && arg+1<argc) {
                    request[option.substr(2)]=std::stoul(argv[++arg]); continue;
                }
                if (index==5) throw std::invalid_argument("At most five robots can battle");
                request["robots"].push_back({{"name",option},{"source",read_file(option)}});
                ++index;
            }
            std::cout << battle_json(request).dump(2) << '\n';
            return 0;
        }
        std::cout << "Robot Warriors headless compatibility core\n"
                     "Usage:\n  robotwar compile SOURCE [--debug]\n"
                     "  robotwar battle SOURCE... [--ticks N] [--seed N]\n"
                     "  robotwar jsonl  # one JSON request and response per line\n";
        return command == "help" || command == "--help" ? 0 : 2;
    } catch (const std::exception& error) {
        std::cerr << error.what() << '\n';
        return 2;
    }
}
