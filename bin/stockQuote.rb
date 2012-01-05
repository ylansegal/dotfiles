#!/usr/bin/env ruby
# Author: Ylan Segal

require 'net/http'
require 'uri'

#Building Symbol lists
symbols = ""
ARGV.each do |a|
  symbols += a + "+"
end
symbols.chop! #Removing last + that is not needed

url = "http://download.finance.yahoo.com/d/quotes.csv?s=#{symbols}&f=sl1p2"
uri = URI.parse(URI.escape(url))
#p uri
response = Net::HTTP.get uri

#Formating response
response.each_line do |line|
	#Extracting data (removing end of line, quotes and spliting into fields)
	name, quote, change = line.chomp.delete!("\"").split(",")
	#Formatting for output
	name = name.ljust(10)
	change = change.rjust(7)
	quote = quote.rjust(10)
	#printing
	puts "#{name}#{change}#{quote}"
end
puts "Updated at: #{Time.now}"
