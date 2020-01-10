require_relative './daft.rb'


class HarderBetterFasterStronger
  extend Daft

  defn foo(bar: String) >> String do
  end

end
