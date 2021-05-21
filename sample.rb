require 'ripper'

code = '1 + 2'

p Ripper.tokenize(code)
# => ["1", " ", "+", " ", "2"]

pp Ripper.sexp(code)
# => [:program, [[:binary, [:@int, "1", [1, 0]], :+, [:@int, "2", [1, 4]]]]]

pp RubyVM::AbstractSyntaxTree.parse(code)

puts RubyVM::InstructionSequence.compile(code, options: false).disasm

puts '************8'

code = <<END
def hoge(a: 1)
end
END
puts RubyVM::InstructionSequence.compile(code, options: false).disasm
