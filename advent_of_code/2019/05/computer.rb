#
# Completed by Zeb DeOs on TBD.
#
class Computer

  class ComputerError < StandardError; end

  class SegFault < ComputerError; end

  class InvalidOperation < ComputerError; end

  # opcode => [op_sym, instruction_size]
  OPCODES = {
     1 => [:op_add,    4],
     2 => [:op_mult,   4],
     3 => [:op_input,  2],
     4 => [:op_output, 2],
    99 => [:op_stop!,  1]
  }

  def self.parse(program_s)
    program_s.strip.split(',').map { |si| si.to_i }
  end

  def self.new_from_s(program_s, **options)
    new(parse(program_s), **options)
  end

  def initialize(program, **options)
    @rom = program
    @stdin = options.fetch(:stdin, $stdin)
    @stdout = options.fetch(:stdout, $stdout)

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

  def op_input(dest_pointer)
    self[dest_pointer] = @stdin.gets.strip.to_i
  end

  def op_output(src_pointer)
    @stdout.puts(self[src_pointer])
  end

end
