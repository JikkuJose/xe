require "faraday"
require "nokogiri"
require_relative "./url"

module XE
  class Currency
    attr_reader :value

    STANDARD_CURRENCY = :usd

    def initialize(symbol)
      @symbol = symbol
      call_api
      parse
      reset_response
    end

    private

    def parse
      @value = Nokogiri::HTML.parse(@response.body)
        .css(selector)
        .children[0]
        .to_s
        .to_f
        .round(2)
    end

    def reset_response
      @response = nil
    end

    def call_api
      @response = Faraday.get(URL::API, params)
    end

    def params
      { "Amount" => 1, "From" => @symbol, "To" => STANDARD_CURRENCY }
    end

    def selector
      ".uccRes > td:nth-child(3)"
    end
  end
end
