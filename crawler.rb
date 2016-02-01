require 'timeout'
class Crawler
  attr_reader :result, :url
  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(open(@url))
    @results = [{
      url: url,
      input_counter: 0,
      parent_url: ''
      }]
    @visited_url = [url]
  end

  def run_crawler
    begin
      Timeout::timeout(10) do
        pages = 0
        puts "page: #{@url} - input count:" + @doc.xpath('//input').count.to_s
        while pages < 50 do
          level = 0
            child_pages = @doc.xpath('//a')
          child_pages.each do |link|
            link = link['href']
            if is_valid_link?(link)
              child_doc = Nokogiri::HTML(open(link))
              puts "page: #{link} - input count:" + child_doc.xpath('//input').count.to_s
              pages += 1
              level += 1
              @visited_url << link
            end
          end
        end
      end
    rescue Timeout::Error
      puts "Timeout error, the crawling is taking too much time."
    end
  end

  private

  def is_valid_link?(link)
    !link.nil? &&
      !link.empty? &&
      link.include?(url) &&
      link != url &&
      !@visited_url.include?(link) &&
      link.scan(/jpg|png|gif/).none? # raw check for file type
  end
end
