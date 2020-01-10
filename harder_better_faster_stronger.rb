require_relative './daft.rb'


class HarderBetterFasterStronger
  extend Daft

  defn harder(how_hard: Integer, multiplier: [Integer, 2]) >> String do
    iph { how_hard < 2 }.then {
      "not hard enough"
    }.elsiph { how_hard == 2 }.then {
      "adequate"
    }.else {
      "now we're talking!"
    }.call
  end

end
