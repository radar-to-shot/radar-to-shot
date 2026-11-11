#include "json_protocol.hpp"
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>

using nlohmann::json;

std::string read_file(const std::string &path) {
  std::ifstream file(path, std::ios::binary);
  if (!file)
    throw std::runtime_error("Cannot read file: " + path);
  return {std::istreambuf_iterator<char>(file), {}};
}

int main(int argc, char **argv) {
  try {
    const std::string command = argc > 1 ? argv[1] : "help";
    if (command == "jsonl") {
      for (std::string line; std::getline(std::cin, line);) {
        std::cout << robotwar::request_json(line) << '\n';
      }
      return 0;
    }
    if (command == "compile" && argc >= 3) {
      auto result =
          robotwar::dispatch_json({{"kind", "compile"},
                                   {"source", read_file(argv[2])},
                                   {"debug", argc > 3 && std::string(argv[3]) == "--debug"}});
      std::cout << result.dump(2) << '\n';
      return result.at("error").get<std::string>().empty() ? 0 : 1;
    }
    if (command == "battle" && argc >= 3) {
      json request = {{"kind", "battle"}, {"robots", json::array()}, {"ticks", 1000}, {"seed", 1}};
      std::size_t index = 0;
      for (int arg = 2; arg < argc; ++arg) {
        std::string option = argv[arg];
        if ((option == "--ticks" || option == "--seed") && arg + 1 < argc) {
          request[option.substr(2)] = std::stoul(argv[++arg]);
          continue;
        }
        if (option == "--stop-when-finished" || option == "--rng-seed") {
          request[option == "--rng-seed" ? "include_rng_seed" : "stop_when_finished"] = true;
          continue;
        }
        if (index == 5)
          throw std::invalid_argument("At most five robots can battle");
        request["robots"].push_back({{"name", option}, {"source", read_file(option)}});
        ++index;
      }
      std::cout << robotwar::dispatch_json(request).dump(2) << '\n';
      return 0;
    }
    std::cout << "Robot Warriors headless compatibility core\n"
                 "Usage:\n  robotwar compile SOURCE [--debug]\n"
                 "  robotwar battle SOURCE... [--ticks N] [--seed N] "
                 "[--stop-when-finished] [--rng-seed]\n"
                 "  robotwar jsonl  # one JSON request and response per line\n";
    return command == "help" || command == "--help" ? 0 : 2;
  } catch (const std::exception &error) {
    std::cerr << error.what() << '\n';
    return 2;
  }
}
