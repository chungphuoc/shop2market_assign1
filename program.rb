require 'nokogiri'
require 'open-uri'
require 'uri'
require 'net/http'
require './crawler.rb'

puts 'Input the website you want to crawl:'
url = gets.strip
unless url =~ URI::regexp
  puts 'Invalid url, using default url'
  url = 'http://shop2market.com/'
  puts url
end

c = Crawler.new(url)
c.run_crawler
c.print_results