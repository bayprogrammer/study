require 'pp'


module Daft

  class Punk
    attr_reader :name
    attr_reader :args
    attr_reader :kwargs
    attr_reader :block
    attr_reader :klass
    attr_reader :oblock
    attr_reader :return_type

    def initialize(method_name, args, kwargs, block, klass)
      @methods_name = method_name
      @args = args
      @kwargs = kwargs
      @block = block
      @klass = klass
    end

    def >>(return_type)
      @return_type = return_type
      self
    end

    def oblock=(oblock)
      @oblock = oblock
    end
  end

  def method_missing(method_name, *args, **kwargs, &block)
    Punk.new(method_name, args, kwargs, block, self)
  end

  def punk(method, &oblock)
    method.oblock = oblock
    p method
    method
  end

  alias_method :defn, :punk
end
