module XE
  class Currency
    attr_reader :value

    def initialize(symbol)
      @symbol = symbol
      run
    end

    def value
      Nokogiri::HTML.parse(@response.body).css(selector).children[0].to_s
    end

    private

    def run
      @response = Faraday.get(URL::API, params)
    end

    def selector
      ".uccRes > td:nth-child(3)"
    end

    def params
      {
        "Amount" => 1,
        "From" => @symbol,
        "To" => to,
      }
    end

    def to
      :usd
    end
  end
end
