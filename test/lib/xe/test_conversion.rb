require_relative "../../test_helper"
require 'xe/conversion'

class ConversionTest < Minitest::Test
  def test_usd_to_usd
    VCR.use_cassette("usd_to_usd_conversion") do
      c = XE::Conversion.new(left: :usd, right: :usd)
      assert_in_delta 0.01, c.left_to_right, c.right_to_left
    end
  end

  def test_text_representation
    VCR.use_cassette("usd_to_usd_conversion") do
      c = XE::Conversion.new(left: :usd, right: :usd)
      result = "1 USD = 1.0 USD\n1 USD = 1.0 USD"
      assert_equal result, c.to_s
    end
  end
end
