#include "robotwar/compiler.hpp"
#include <algorithm>
#include <limits>
#include <map>
#include <stdexcept>
#include <utility>

namespace robotwar {
namespace {
struct Token {
  std::string text;
  SourceSpan source;
  bool number{};
};

constexpr const char *eol_error =
    "End of line was not expected here.  Something is missing on this line";
const std::map<std::string, int> registers{{"X", 0},
                                           {"Y", 1},
                                           {"AIM", 2},
                                           {"SHOT", 3},
                                           {"DAMAGE", 4},
                                           {"SPEED", 5},
                                           {"DIRECTION", 6},
                                           {"FUEL", 7},
                                           {"CLOAK", 8},
                                           {"NUM_ROBOTS", 9},
                                           {"TIME_INT_MASK", 10},
                                           {"TIME_INT_XFER", 11},
                                           {"X_CONV", 12},
                                           {"Y_CONV", 13},
                                           {"ANGLE_CONV", 14},
                                           {"DIST_CONV", 15},
                                           {"RADAR", 16},
                                           {"RANDOM", 17},
                                           {"STACK", 18}};
const std::map<std::string, int> constants{{"XMAX", 381}, {"YMAX", 313}, {"SHOT_SPEED", 18}};
const std::map<std::string, int> attributes{
    {"CPU_SPEED", 0},     {"FIRE_RATE", 1}, {"ENGINE_SIZE", 2}, {"RADAR_RANGE", 3},
    {"FUEL_CAPACITY", 4}, {"CLOAKING", 5},  {"ARMOR", 6}};
const std::map<std::string, int> operators{{"+", 2},   {"-", 3},   {"*", 4},  {"/", 5},
                                           {"MOD", 6}, {"AND", 7}, {"OR", 8}, {"XOR", 9}};
const std::map<std::string, int> comparisons{{"=", 10},  {">", 11},  {"<", 12},
                                             {">=", 13}, {"<=", 14}, {"<>", 15}};
const std::map<std::string, int> simple{
    {"RETURN", 19}, {"ENDINT", 20}, {"TRACE", 21}, {"RESET", 22}};

bool alpha(char c) {
  return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z');
}

bool digit(char c) {
  return c >= '0' && c <= '9';
}

bool reserved(const std::string &s) {
  return registers.contains(s) || constants.contains(s) || attributes.contains(s) ||
         operators.contains(s) || comparisons.contains(s) || simple.contains(s) ||
         s == "ALLOCATE" || s == "DEFINE" || s == "IF" || s == "THEN" || s == "ELSE" ||
         s == "END" || s == "WHILE" || s == "DO" || s == "REPEAT" || s == "UNTIL" || s == "GOTO" ||
         s == "GOSUB" || s == "TO";
}

struct Failure {
  Diagnostic diagnostic;
};

struct Symbol {
  std::uint8_t mode{3};
  std::int16_t value{};
  bool defined{};
  SourceSpan source;
  std::int16_t index{};
};

struct Fixup {
  std::size_t instruction;
  std::string symbol;
  bool indirect{};
  bool address{};
};

struct Block {
  enum Kind { If, Else, While, Repeat } kind;

  std::size_t branch{}, start{};
};

class Compiler {
  std::string_view source_;
  bool debug_;
  bool unmatched_until_{};
  std::vector<Token> tokens_;
  std::size_t pos_{};
  Program program_;
  std::map<std::string, Symbol> symbols_;
  std::string last_symbol_;
  std::vector<Fixup> fixups_;
  std::vector<Block> blocks_;
  Token last_;

  [[noreturn]] void fail(std::string message, const Token &token) {
    throw Failure{{std::move(message), token.source}};
  }

  [[noreturn]] void fail(std::string message) {
    fail(std::move(message), peek());
  }

  const Token &peek() const {
    return tokens_[std::min(pos_, tokens_.size() - 1)];
  }

  Token take() {
    last_ = peek();
    if (pos_ + 1 < tokens_.size())
      ++pos_;
    return last_;
  }

  bool accept(std::string_view s) {
    if (peek().text != s)
      return false;
    take();
    return true;
  }

  bool end() const {
    return peek().text == "\n" || peek().text.empty();
  }

  void expect(std::string_view s) {
    if (!accept(s))
      fail(end() ? eol_error : "Expected " + std::string(s));
  }

  void bad_token(const Token &t) {
    if (t.text == "TO")
      fail("The TO statement is not allowed here.  Only allowed in assignment "
           "statements",
           t);
    if (t.text == "THEN")
      fail("THEN is not allowed here", t);
    if (registers.contains(t.text))
      fail("A register is not allowed here", t);
    if (t.number)
      fail("A constant (ie number) is not allowed here", t);
    if (operators.contains(t.text))
      fail("An operator can not be used here", t);
    if (comparisons.contains(t.text))
      fail("A compare is not allowed here.  A compare is only allowed in if "
           "statements",
           t);
    if (!t.text.empty() && !alpha(t.text[0]) &&
        std::string("&^\n").find(t.text[0]) == std::string::npos)
      fail("Unrecognized symbol or character in file:  char #" +
               std::to_string(static_cast<unsigned char>(t.text[0])),
           t);
    if (!t.text.empty() && alpha(t.text[0]) && !reserved(t.text))
      fail("This looks like a label which isn't allowed here", t);
    fail(end() ? eol_error : "Unexpected token: " + t.text, t);
  }

  void line_end() {
    if (!end())
      bad_token(peek());
  }

  void lex() {
    std::size_t i = 0, line = 0;
    while (i < source_.size()) {
      auto start = i;
      char c = source_[i++];
      if (c == ' ' || c == '\t')
        continue;
      if (c == ';') {
        while (i < source_.size() && source_[i] != '\r' && source_[i] != '\n')
          ++i;
        continue;
      }
      if (c == '\r' || c == '\n') {
        if (c == '\r' && i < source_.size() && source_[i] == '\n')
          ++i;
        tokens_.push_back({"\n", {start, i - start, line++}, false});
        continue;
      }
      std::string value(1, c);
      bool num = digit(c);
      if (alpha(c)) {
        while (i < source_.size() && (alpha(source_[i]) || digit(source_[i]) || source_[i] == '_'))
          ++i;
        value = std::string(source_.substr(start, std::min<std::size_t>(15, i - start)));
        for (char &ch : value)
          if (ch >= 'a' && ch <= 'z')
            ch -= 32;
      } else if (num) {
        while (i < source_.size() && digit(source_[i]))
          ++i;
        // Original numeric reader leaves the final digit for a second token at
        // EOF.
        if (i == source_.size() && i - start > 1)
          --i;
        value = std::string(source_.substr(start, i - start));
      } else if ((c == '<' || c == '>') && i < source_.size() &&
                 (source_[i] == '=' || (c == '<' && source_[i] == '>')))
        value += source_[i++];
      else if (std::string("+-*/<>=&^").find(c) == std::string::npos) {
        // Preserve the token so a later lexical error retains prior output.
      }
      tokens_.push_back({std::move(value), {start, i - start, line}, num});
    }
    tokens_.push_back({"", {source_.size(), 0, line}, false});
  }

  std::size_t emit(int op, int mode, int value, const Token &t) {
    auto index = program_.code.size();
    if (index >= 2000)
      fail("Sorry,  your code is too long.   Remember,  bigger isn't always "
           "better",
           t);
    program_.code.push_back({static_cast<std::uint8_t>(op), static_cast<std::uint8_t>(mode),
                             static_cast<std::int16_t>(value)});
    program_.source_map.push_back(t.source);
    return index;
  }

  void patch(std::size_t index, std::size_t target) {
    program_.code[index].mode = 2;
    program_.code[index].operand = static_cast<std::int16_t>(target);
  }

  int number(bool sign = true) {
    int factor = 1;
    Token sign_token = peek();
    if (sign && (accept("-") || accept("+"))) {
      factor = last_.text == "-" ? -1 : 1;
      if (!peek().number || peek().source.offset != sign_token.source.offset + 1)
        fail("Constant expected.  Expecting:  " + sign_token.text + "<constant>",
             Token{"", {sign_token.source.offset + 1, 1, sign_token.source.line}, false});
    }
    auto t = take();
    if (constants.contains(t.text))
      return constants.at(t.text);
    if (!t.number)
      bad_token(t);
    int n = 0;
    for (char c : t.text) {
      n = n * 10 + c - '0';
      if (n > 32767)
        fail("Constant too large.  32767 is the largest constant allowed", t);
    }
    return factor * n;
  }

  Symbol &symbol(const Token &t) {
    auto [it, added] = symbols_.try_emplace(
        t.text, Symbol{3, 0, false, t.source, static_cast<std::int16_t>(symbols_.size())});
    if (added)
      last_symbol_ = t.text;
    if (added && symbols_.size() >= 200)
      fail("Symbol table overflow", t);
    return it->second;
  }

  void declaration(bool allocate) {
    auto name = take();
    if (name.text.empty() || name.text == "\n" || !alpha(name.text[0]) || reserved(name.text))
      bad_token(name);
    symbol(name);
    // CODE5:1296 updates count-1, even when the declaration names an earlier
    // symbol.
    auto &s = symbols_.at(last_symbol_);
    s.defined = true;
    if (allocate) {
      int count = 1;
      if (!end())
        count = number();
      s.mode = 4;
      s.value = static_cast<std::int16_t>(program_.allocated_memory);
      if (static_cast<int>(program_.allocated_memory) + count > 200)
        fail("Too many memory locations allocated", last_);
      program_.allocated_memory = static_cast<std::int16_t>(program_.allocated_memory + count);
    } else {
      s.mode = 2;
      if (registers.contains(peek().text)) {
        s.mode = 1;
        s.value = registers.at(take().text);
      } else
        s.value = static_cast<std::int16_t>(number());
    }
    line_end();
  }

  void operand(int op, bool unary = true, bool destination = false, bool literal_allowed = true) {
    bool address = accept("&");
    auto t = peek();
    if (t.number || (unary && (t.text == "-" || t.text == "+"))) {
      if (address)
        fail("Illegal use of the \"address of\" operator", t);
      int n = number(unary);
      if (!literal_allowed)
        fail("A constant (ie number) is not allowed here", last_);
      if (destination)
        fail("A constant (ie number) is not allowed here", t);
      emit(op, 2, n, t);
      return;
    }
    take();
    if (auto it = registers.find(t.text); it != registers.end()) {
      if (address)
        fail("Illegal use of the \"address of\" operator", t);
      emit(op, 1, it->second, t);
    } else if (auto it = constants.find(t.text); it != constants.end()) {
      if (destination || !literal_allowed)
        fail("A constant (ie number) is not allowed here", t);
      emit(op, 2, it->second, t);
    } else if (!t.text.empty() && alpha(t.text[0]) && !reserved(t.text)) {
      auto &s = symbol(t);
      auto instruction = emit(op, address ? 2 : 3, s.index, t);
      if (address) {
        // Original inserts a symbol before address lookup, so unknown addresses
        // read zero.
        program_.code[instruction].operand = s.value;
      } else {
        fixups_.push_back({instruction, t.text, false, false});
      }
    } else
      bad_token(t);
    if (accept("^")) {
      if (address)
        fail("pointer de-reference not allowed here", last_);
      if (fixups_.empty() || fixups_.back().instruction != program_.code.size() - 1)
        fail("pointer de-reference not allowed here", last_);
      fixups_.back().indirect = true;
      program_.code.back().mode = 5;
    }
  }

  void expression() {
    operand(1, true);
    while (operators.contains(peek().text)) {
      int op = operators.at(peek().text);
      take();
      operand(op, false);
    }
  }

  void push(Block b, const Token &t) {
    if (blocks_.size() >= 15)
      fail("Error.  Nesting of conditionals is too deep.", t);
    blocks_.push_back(b);
  }

  void condition() {
    expression();
    auto it = comparisons.find(peek().text);
    if (it == comparisons.end())
      bad_token(peek());
    int op = it->second;
    take();
    operand(op, true);
  }

  void assignment() {
    expression();
    if (!accept("TO")) {
      if (end())
        fail(eol_error);
      bad_token(peek());
    }
    do {
      operand(16, true, true);
    } while (accept("TO"));
    line_end();
  }

  void statement(bool inline_if = false) {
    Token t = peek();
    if (unmatched_until_) {
      if (t.text == "END")
        fail("END statement not allowed here", t);
      bad_token(t);
    }
    if (accept("ALLOCATE")) {
      if (inline_if)
        fail("A variable allocation cannot be used here.", t);
      declaration(true);
      return;
    }
    if (accept("DEFINE")) {
      if (inline_if)
        fail("A constant declaration is not allowed here", t);
      declaration(false);
      return;
    }
    if (auto it = attributes.find(t.text); it != attributes.end()) {
      take();
      if (inline_if)
        fail("An attribute value cannot be used here, it can only be set to a "
             "constant.",
             t);
      int value = number();
      static constexpr int limits[]{2, 4, 1, 2, 2, 1, 5};
      program_.attributes[it->second] = static_cast<std::int16_t>(value);
      if (value < 0 || value > limits[it->second])
        fail("The limits of this attribute have been exceeded, the limit is "
             "from 0 to " +
                 std::to_string(limits[it->second]) + ".",
             last_);
      program_.attributes[it->second] = static_cast<std::int16_t>(value);
      line_end();
      return;
    }
    if (accept("IF")) {
      if (inline_if)
        fail("An IF statement is not allowed here", t);
      condition();
      auto cmp = program_.code.size() - 1;
      expect("THEN");
      if (end()) {
        program_.code[cmp].opcode = 25 - program_.code[cmp].opcode;
        auto branch = emit(18, 0, 0, t);
        push({Block::If, branch, 0}, peek());
        return;
      }
      bool single = peek().text == "GOTO" || peek().text == "GOSUB" || peek().text == "RETURN" ||
                    peek().text == "ENDINT" || peek().text == "RESET";
      if (single || peek().text == "TRACE") {
        statement(true);
        return;
      }
      if (peek().text == "IF")
        fail("An IF statement is not allowed here");
      if (peek().text == "ALLOCATE")
        fail("A variable allocation cannot be used here.");
      if (peek().text == "DEFINE")
        fail("A constant declaration is not allowed here");
      program_.code[cmp].opcode = 25 - program_.code[cmp].opcode;
      auto branch = emit(18, 0, 0, t);
      try {
        statement(true);
      } catch (const Failure &) {
        if (program_.code.size() == branch + 1) {
          program_.code.resize(branch);
          program_.source_map.resize(branch);
          program_.code[cmp].opcode = 25 - program_.code[cmp].opcode;
        } else
          patch(branch, program_.code.size());
        throw;
      }
      patch(branch, program_.code.size());
      return;
    }
    if (accept("WHILE")) {
      if (inline_if)
        fail("A WHILE statement is not allowed here", t);
      auto start = program_.code.size();
      condition();
      expect("DO");
      line_end();
      program_.code.back().opcode = 25 - program_.code.back().opcode;
      auto branch = emit(18, 0, 0, t);
      push({Block::While, branch, start}, t);
      return;
    }
    if (accept("REPEAT")) {
      if (inline_if)
        fail("ERROR: A REPEAT statment is not allowed here.", t);
      line_end();
      push({Block::Repeat, 0, program_.code.size()}, t);
      return;
    }
    if (accept("UNTIL")) {
      if (inline_if)
        fail("An UNTIL statement is not allowed here", t);
      condition();
      line_end();
      if (blocks_.empty())
        fail("Error:  END or ELSE statement without matching IF", peek());
      auto b = blocks_.back();
      blocks_.pop_back();
      if (b.kind != Block::Repeat) {
        unmatched_until_ = true;
        return;
      }
      program_.code.back().opcode = 25 - program_.code.back().opcode;
      emit(18, 2, b.start, t);
      return;
    }
    if (accept("ELSE")) {
      if (inline_if)
        fail("ELSE statement not allowed here", t);
      if (blocks_.empty() || blocks_.back().kind != Block::If)
        fail("ELSE statement not allowed here.  Missing IF above", t);
      auto old = blocks_.back().branch;
      auto branch = emit(18, 0, 0, t);
      patch(old, program_.code.size());
      blocks_.back() = {Block::Else, branch, 0};
      line_end();
      return;
    }
    if (accept("END")) {
      if (inline_if)
        fail("END statement not allowed here", t);
      if (blocks_.empty())
        fail("END statement not allowed here.  Missing IF, WHILE, or ELSE above", t);
      auto b = blocks_.back();
      blocks_.pop_back();
      if (b.kind == Block::Repeat)
        fail("END statement not allowed here.  Missing IF, WHILE, or ELSE above", t);
      if (b.kind == Block::While)
        emit(18, 2, b.start, t);
      patch(b.branch, program_.code.size());
      line_end();
      return;
    }
    if (accept("GOTO") || accept("GOSUB")) {
      int op = last_.text == "GOTO" ? 18 : 17;
      operand(op, true, false, false);
      line_end();
      return;
    }
    if (auto it = simple.find(t.text); it != simple.end()) {
      take();
      if (it->second != 21 || debug_)
        emit(it->second, 0, 0, t);
      line_end();
      return;
    }
    // A bare unknown identifier declares a label, including forward references.
    if (!t.text.empty() && alpha(t.text[0]) && !reserved(t.text) && pos_ + 1 < tokens_.size() &&
        (tokens_[pos_ + 1].text == "\n" ||
         (tokens_[pos_ + 1].text.empty() &&
          source_.substr(t.source.offset + t.source.length).find(';') != std::string_view::npos))) {
      take();
      auto &s = symbol(t);
      if (s.defined)
        fail("Symbol already defined: " + t.text, t);
      s.defined = true;
      s.mode = 3;
      s.value = static_cast<std::int16_t>(program_.code.size());
      s.source = {program_.code.size(), 0, t.source.line};
      return;
    }
    assignment();
  }

public:
  Compiler(std::string_view source, bool debug) : source_(source), debug_(debug) {}

  CompileResult run() {
    try {
      lex();
      if (source_.size() < 2)
        fail("Program too short.  C'mon, you can do better then that");
      while (!peek().text.empty()) {
        if (accept("\n"))
          continue;
        statement();
        if (program_.code.size() > 1990)
          fail("Sorry,  your code is too long.   Remember,  bigger isn't "
               "always better");
        if (accept("\n"))
          continue;
        if (!peek().text.empty())
          fail("Unexpected token: " + peek().text);
      }
      if (!blocks_.empty())
        fail("END expected but never found");
      int sum = 0;
      for (auto n : program_.attributes)
        sum += n;
      if (sum > 6)
        fail("You have allocated " + std::to_string(sum) +
                 " points worth of attributes.  The limit is 6.",
             Token{"", {1, 0, 0}, false});
      emit(22, 0, 0, peek());
      for (const auto &f : fixups_) {
        auto &s = symbols_.at(f.symbol);
        auto &inst = program_.code[f.instruction];
        if (!s.defined)
          fail("Undefined Symbol: " + f.symbol, Token{f.symbol, s.source, false});
        if (f.indirect && s.mode == 3)
          fail("A program label cannot be dereferenced ", peek());
        inst.mode = f.indirect ? 5 : s.mode;
        inst.operand = s.value;
        if (inst.opcode == 16 && (s.mode == 2 || s.mode == 3))
          fail("At machine instruction " + std::to_string(f.instruction) + " out of " +
                   std::to_string(program_.code.size()) + ", the symbol " + f.symbol +
                   " is used as a register or memory location.",
               Token{f.symbol, s.source, false});
      }
      return {std::move(program_), static_cast<std::uint16_t>(source_.size() - 1), std::nullopt};
    } catch (const Failure &f) {
      return {std::move(program_),
              static_cast<std::uint16_t>(
                  source_.empty() ? 65535
                                  : std::min(source_.size() - 1, f.diagnostic.source.offset +
                                                                     f.diagnostic.source.length)),
              f.diagnostic};
    }
  }
};
} // namespace

CompileResult compile(std::string_view source, bool debug) {
  return Compiler(source, debug).run();
}

std::vector<std::uint8_t> encode_bytecode(const Program &program) {
  std::vector<std::uint8_t> bytes;
  bytes.reserve(program.code.size() * 4);
  for (const auto &i : program.code) {
    bytes.push_back(i.opcode);
    bytes.push_back(i.mode);
    auto v = static_cast<std::uint16_t>(i.operand);
    bytes.push_back(v >> 8);
    bytes.push_back(v & 255);
  }
  return bytes;
}
} // namespace robotwar

namespace robotwar {
ScanResult scan_token(std::string_view source, std::uint16_t offset, bool has_operand) {
  ScanResult r;
  std::size_t p = offset;
  auto get = [&](std::size_t at) -> char { return at < source.size() ? source[at] : '\0'; };
  auto upper = [](char ch) -> char { return ch >= 'a' && ch <= 'z' ? ch - 32 : ch; };
  char first = upper(get(p++));
  auto numeric = [&](char ch) {
    if (!digit(ch))
      return false;
    r.kind = 18;
    std::int32_t n = 0;
    do {
      n = n * 10 + ch - '0';
      ch = upper(get(p++));
      if (n > 32767)
        r.error = "Constant too large.  32767 is the largest constant allowed";
    } while (digit(ch) && r.error.empty() && p < source.size());
    --p;
    r.value = static_cast<std::int16_t>(n);
    return true;
  };
  if (alpha(first)) {
    r.symbol += first;
    while (p < source.size() && (alpha(get(p)) || digit(get(p)) || get(p) == '_')) {
      if (r.symbol.size() < 15)
        r.symbol += upper(get(p));
      ++p;
    }
    if (auto i = registers.find(r.symbol); i != registers.end()) {
      r.kind = 1;
      r.value = i->second;
    } else if (auto i = constants.find(r.symbol); i != constants.end()) {
      r.kind = 18;
      r.value = i->second;
    } else if (auto i = attributes.find(r.symbol); i != attributes.end()) {
      r.kind = 21;
      r.attribute = i->second;
    } else if (auto i = operators.find(r.symbol); i != operators.end()) {
      r.kind = 2;
      r.operation = i->second;
    } else {
      static const std::map<std::string, int> keywords{
          {"IF", 4},      {"THEN", 5},    {"ELSE", 6}, {"WHILE", 7},   {"DO", 8},
          {"REPEAT", 9},  {"UNTIL", 10},  {"END", 11}, {"GOTO", 12},   {"GOSUB", 13},
          {"RETURN", 14}, {"ENDINT", 15}, {"TO", 16},  {"DEFINE", 19}, {"ALLOCATE", 22},
          {"TRACE", 25},  {"RESET", 26}};
      auto k = keywords.find(r.symbol);
      r.kind = k == keywords.end() ? 20 : k->second;
    }
  } else if (first == '\r')
    r.kind = 0;
  else if (first == ';')
    r.kind = 17;
  else if (numeric(first)) {
  } else if ((first == '+' || first == '-') && !has_operand) {
    if (p >= source.size()) {
      r.error = eol_error;
      --p;
    } else if (!numeric(upper(get(p++))))
      r.error = std::string("Constant expected.  Expecting:  ") + first + "<constant>";
    else if (first == '-')
      r.value = static_cast<std::int16_t>(-r.value);
  } else if (first == '+' || first == '-' || first == '*' || first == '/') {
    r.kind = 2;
    r.operation = operators.at(std::string(1, first));
  } else if (first == '<' || first == '>' || first == '=') {
    std::string op(1, first);
    if (p < source.size() && (first == '<' || first == '>') &&
        (get(p) == '=' || (first == '<' && get(p) == '>')))
      op += get(p++);
    r.kind = 3;
    r.operation = comparisons.at(op);
  } else if (first == '&')
    r.kind = 23;
  else if (first == '^')
    r.kind = 24;
  else
    r.error = "Unrecognized symbol or character in file:  char #" +
              std::to_string(static_cast<unsigned char>(first));
  r.next_offset = static_cast<std::uint16_t>(p);
  return r;
}
} // namespace robotwar
