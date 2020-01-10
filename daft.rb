require 'pp'


module Daft

  class Method
    attr_reader :name
    attr_reader :args
    attr_reader :kwargs
    attr_reader :block
    attr_reader :oblock
    attr_reader :return_type

    def initialize(method_name, args, kwargs, block)
      @methods_name = method_name
      @args = args
      @kwargs = kwargs
      @block = block
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
    Method.new(method_name, args, kwargs, block)
  end

  def punk(method, &oblock)
    method.oblock = oblock
    p method
    method
  end

end

class HarderBetterFasterStronger
  extend Daft

  punk foo(bar: String) >> String do
  end

end
