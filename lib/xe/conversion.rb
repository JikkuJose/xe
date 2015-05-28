require_relative "./currency"

module XE
  class Conversion
    def initialize(left: nil, right: nil)
      @left_symbol = symbolize(left)
      @right_symbol = symbolize(right)

      @left = Currency.new(left)
      @right = Currency.new(right)
    end

    def left_to_right
      (@left.value / @right.value).round(2)
    end

    def right_to_left
      (@right.value / @left.value).round(2)
    end

    def to_s
      "1 #{@left_symbol} = #{left_to_right} #{@right_symbol}" +
        "\n" +
        "1 #{@right_symbol} = #{right_to_left} #{@left_symbol}"
    end

    def symbolize(symbol)
      symbol.to_s.upcase
    end
  end
end
