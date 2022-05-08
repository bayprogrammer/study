class Type
  def self.lookup(primitive)
    $types ||= {}
    $types[primitive] ||= ::Type.new(primitive)
  end

  def initialize(primitive)
    @primitive = primitive
  end

  def inspect
    "<Type: #{primitive.inspect}>"
  end

  def primitive
    @primitive
  end

  def type?
    true
  end

  alias :orig_eq :==
  def ==(object)
    if object.type?
      self.orig_eq(object)
    else
      object.is_a?(primitive)
    end
  end
end

class Object
  def type
    ::Type.lookup(self.class)
  end

  def type?
    false
  end
end

class Class
  def type
    ::Type.lookup(self)
  end

  def type?
    false
  end

  def method_missing(method_sym, *args, &block)
    "#{method_sym.to_s}(#{args.join(", ")}) { #{block.inspect} }"
  end

  def defn(typed_function, &block)
    puts "#{self.inspect}##{typed_function}  ((#{block.inspect}))"
  end
end

class Foo
  defn excellent(a: Numeric, b: String) do
    puts "a is #{a}, b is #{b}"
  end

  defn average(f: Hash) { f }

  defn poor(x: Array) do; f; end

  defn undetermined(y: Integer) {
    y
  }

  darnitall
end
