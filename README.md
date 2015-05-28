# Xe

Simple wrapper around xe.com currency conversion site.

## Installation

    $ gem install xe

## Usage

Not intended to be used in production; just an academic experiment.

To get a list of conversions:

    conversions = XE::Convert.among(:usd, :aed, :inr, gbp)

The `to_s` method in the conversion object prints a greppable output:

    conversions.each { |c| puts c }
    # =>
    # 1 USD = 3.7 AED
    # 1 AED = 0.27 USD
    # 1 USD = 50.0 INR
    # 1 INR = 0.02 USD
    # 1 USD = 0.65 GBP
    # 1 GBP = 1.53 USD
    # 1 AED = 13.5 INR
    # 1 INR = 0.07 AED
    # 1 AED = 0.18 GBP
    # 1 GBP = 5.67 AED
    # 1 INR = 0.01 GBP
    # 1 GBP = 76.5 INR

## Contributing

1. Fork it ( https://github.com/JikkuJose/xe/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
