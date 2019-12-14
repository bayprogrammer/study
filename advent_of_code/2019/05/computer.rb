#
# example usage:
#
#   $ irb
#   > require './computer.rb'
#   > program = open('./01_input.txt', 'r') { |f| f.readline }.strip.split(',').map { |si| si.to_i }
#   > c = Computer.new(program)
#   > c[1] = 12
#   > c[2] =  2
#   > c.run!
#   > c[0]
#   > ga = GravAssistInterface.new(program)
#   > ga[12, 2]
#   > ga.find(19690720)
#   > ga.answer(19690720)
#
# Completed by Zeb DeOs on TBD.
#
class Computer

  class ComputerError < StandardError; end

  class SegFault < ComputerError; end

  class InvalidOperation < ComputerError; end

  # opcode => [op_sym, instruction_size]
  OPCODES = {
     1 => [:op_add,   4],
     2 => [:op_mult,  4],
    99 => [:op_stop!, 1]
  }

  def self.parse(program_s)
    program_s.strip.split(',').map { |si| si.to_i }
  end

  def self.new_from_s(program_s)
    new(parse(program_s))
  end

  def initialize(program)
    @rom = program
    reset!
  end

  def reset!
    @memory = @rom.dup
    @running = true

    @instruction_pointer = 0
    read_instruction!

    self
  end

  def inspect
    {
      memory: @memory.dup,
      running: @running,

      instruction_pointer: @instruction_pointer,
      op_register: @op_register,
      param_registers: @param_registers,
      param_values: @param_registers.map { |p| self[p] },
      instruction_size: @instruction_size
    }
  end

  def [](address)
    valid_address!(address)
    @memory[address]
  end

  def []=(address, value)
    valid_address!(address)
    @memory[address] = value
  end

  def run!
    step! while running?

    self
  end

  def step!
    execute!
    advance!
    read_instruction!

    self
  end

  def running?
    @running
  end

  def to_s
    @memory.join(',')
  end

  private

  def valid_address!(address)
    raise(SegFault) if @memory[address].nil?
  end

  def read_instruction!
    return unless running?

    opcode = self[@instruction_pointer]
    @op_register, @instruction_size = OPCODES[opcode]

    if (@op_register.nil? || @instruction_size.nil?)
      raise(InvalidOperation, "#{opcode} is not a valid opcode")
    end

    _, *@param_registers = @memory.slice(
      @instruction_pointer, @instruction_size)
  end

  def execute!
    send(@op_register, *@param_registers)
  end

  def advance!
    @instruction_pointer += @instruction_size
  end

  def op_stop!
    @running = false
  end

  def op_add(term_a_pointer, term_b_pointer, output_pointer)
    self[output_pointer] = self[term_a_pointer] + self[term_b_pointer]
  end

  def op_mult(factor_a_pointer, factor_b_pointer, output_pointer)
    self[output_pointer] = self[factor_a_pointer] * self[factor_b_pointer]
  end

end


class GravAssistInterface

  def initialize(program)
    @computer = Computer.new(program)
  end

  def call(noun, verb)
    @computer.reset!

    @computer[1] = noun
    @computer[2] = verb
    @computer.run!
    @computer[0]
  end
  alias_method :[], :call

  def find(target)
    (0...99).each do |noun|
      (0...99).each do |verb|
        r = call(noun, verb)
        return [noun, verb] if r == target
      end
    end
  end

  def answer(target)
    noun, verb = find(target)
    (100 * noun) + verb
  end

end
