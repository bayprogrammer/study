alias :fn :lambda

### Currying ###

# currying
fn { |x| fn { |y|
  puts "x: #{x} y: #{y}"
}}.(45).(53)

# same thing with stabby-proc
->(x) { ->(y) {
  puts "x: #{x} y: #{y}"
}}.(1).(2)

# alt use (stabby)
->x {->y {
  puts "x: #{x} y: #{y}"
}}[1][2]


### Mess with structures based on closures ###

Obj = Class.new do
  def initialize(&block); @block = block; end
  def call(*args); @block.(*args); end
  alias :[] :call
  def self.call(&block); self.new(&block); end
  def self.[](&block); self.new(&block); end
  def inspect; self.(:inspect); end
end

cons = fn { |car, cdr|
  Obj.[] { |msg|
    case msg
    when :car
      car
    when :cdr
      cdr
    when :inspect
      "(#{car.inspect} . #{cdr.inspect})"
    end
  }
}

car = fn { |cons_cell|
  cons_cell.(:car)
}

cdr = fn { |cons_cell|
  cons_cell.(:cdr)
}

puts cons.("Zeb", "DeOs").(:inspect)
puts cons.("Zeb", cons.("Tiffany", cons.("Ben", nil))).(:inspect)
