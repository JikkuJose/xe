require "json"

require "xe/version"
require "xe/currency"
require "xe/url"
require "xe/conversion"

module XE
  class Convert
    def self.among(symbols)
      symbol_combinations = symbols.combination(2).to_a
      symbol_combinations.map do |left, right|
        Conversion.new(left: left, right: right)
      end
    end
  end
end
