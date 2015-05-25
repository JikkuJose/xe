require_relative "test_helper"
require "xe"

class ConvertTest < Minitest::Test
  def test_if_class_is_present
    assert XE::Convert
  end

  def test_conversion
    skip
    currency_symbols = [:usd, :aed, :inr]
    currencies = XE::Convert.among(currency_symbols)
    assert_equal 3, currencies.count
  end
end
