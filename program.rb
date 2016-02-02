require 'nokogiri'
require 'open-uri'
require 'uri'
require 'net/http'
require './crawler.rb'

puts 'Please input the url you want to crawl:'
url = gets.strip
unless url =~ URI::regexp
  url = 'http://shop2market.com/'
  puts "Invalid url, crawling default url #{url}"
end

c = Crawler.new(url)
c.run_crawler
c.print_results