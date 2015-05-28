require_relative "test_helper"
require "xe"

class ConvertTest < Minitest::Test
  def test_if_class_is_present
    assert XE::Convert
  end

  def test_conversion
    currency_symbols = [:aed, :inr]
    VCR.use_cassette("usd_to_aed") do
      conversions = XE::Convert.among(currency_symbols)
      assert_equal 1, conversions.count
    end
  end
end
