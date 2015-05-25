
#! /usr/bin/env ruby

require 'open-uri'
require 'nokogiri'


## Config

arguments = ["USD", 1, "INR"]

class XE

	attr_accessor :from, :to, :amount, :converted_amount
	attr_reader :cs_rupee



	def initialize(from, amount, to)
		@from = from
		@amount = amount		
		@to = to	
		@cs_rupee = ".uccRes > td:nth-child(3)"	
  	end

	def url
		"http://www.xe.com/currencyconverter/convert/?Amount=#{ @amount }&From=#{ @from }&To=#{ @to }"
	end

end




## Command line arguments

ARGV.each_with_index { |argument, index| arguments[index] = argument }
	


## Parsing

xe_api = XE.new( arguments[0], arguments[1], arguments[2] )

page_html = open( xe_api.url ).read()
page_nokogiri = Nokogiri::HTML( page_html )


page_section = page_nokogiri.css( xe_api.cs_rupee )




## Output formatting

rupee_exchange_rate = page_section 
xe_api.converted_amount = rupee_exchange_rate.children()[0].to_s[0..-2]

puts xe_api.amount.to_s + " " + xe_api.from + " = " + xe_api.converted_amount + " " + xe_api.to 





