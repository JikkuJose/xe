require_relative "../../test_helper"

class CurrencyTest < Minitest::Test
  def test_extraction_of_individual_currency
    VCR.use_cassette('usd_to_usd') do |v|
      c = XE::Currency.new(:usd)

      assert_equal 1, c.value.to_i
    end
  end
end
