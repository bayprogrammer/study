#
# example usage:
#
#   $ irb
#   > require './computer.rb'
#   > orig_prog = open('./01_input.txt', 'r') { |f| f.readline }.strip.split(',').map { |si| si.to_i }
#   > fixed_prog = orig_prog.dup
#   > fixed_prog[1] = 12
#   > fixed_prog[2] = 2
#   > c = Computer.new(fixed_prog.dup)
#   > c.run!
#   > c2 = Computer.new(fixed_prog.dup)
#   > c2.running? && c2.step!
#   > c2.running? && c2.step!
#   > c2.running? && c2.step!
#   > c2.running? && c2.step!
#   > c2.running? && c2.step!
#   > ...
#
class Computer

  class ComputerError < StandardError; end

  class SegFault < ComputerError; end

  class InvalidOperation < ComputerError; end

  def initialize(program)
    @memory = program
    @op_reg = 0
    @running = true
  end

  def inspect
    {
      running: @running,
      op_reg: @op_reg,
      current_instruction: current_instruction,
      memory: @memory.dup
    }
  end

  def [](register)
    valid_address!(register)
    @memory[register]
  end

  def []=(register, value)
    valid_address!(register)
    @memory[register] = value
  end

  def run!
    step! while running?

    self
  end

  def step!
    opcode, input_reg_a, input_reg_b, output_reg = current_instruction
    dispatch(opcode, input_reg_a, input_reg_b, output_reg)

    advance!

    self
  end

  def running?
    @running
  end

  private

  def stop!
    @running = false
  end

  def valid_address!(register)
    raise(SegFault) if @memory[register].nil?
  end

  def current_instruction
    # It ain't a SegFault until you try to dereference an invalid pointer :-D
    @memory.slice(@op_reg, 4)
  end

  def advance!
    next_op_reg = @op_reg + 4

    if @memory.size >= next_op_reg
      @op_reg = next_op_reg
    else
      # program counter overflow behavior not specified, so let's wrap around
      # (and allow, therefore, for the clever Intcode programmer to construct
      # loops)
      @op_reg = 0
    end
  end

  def dispatch(opcode, input_reg_a, input_reg_b, output_reg)
    case opcode
    when 1
      self[output_reg] = self[input_reg_a] + self[input_reg_b]
    when 2
      self[output_reg] = self[input_reg_a] * self[input_reg_b]
    when 99
      stop!
    else
      raise InvalidOperation, "#{opcode} is not a valid opcode"
    end
  end
end
