require 'timeout'
class Crawler
  attr_reader :result, :url
  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(open(@url))
    @results = []
    @visited_url = [url]
  end

  def run_crawler
    begin
      Timeout::timeout(100) do
        puts "Crawling : #{url} & child pages are in process. Please wait..."
        pages = 1
        @count_input = {}
        @count_input[url] = 0
        @count_input[url] += @doc.xpath('//input').count
        while pages < 50 do
          pages += 1
          level = 0
          child_pages = @doc.xpath('//a')
          child_pages.each do |link|
            link = link['href']
            if is_valid_link?(link)
              level += 1
              break if level >= 3
              child_doc = Nokogiri::HTML(open(link))
              @count_input[url] += child_doc.xpath('//input').count
              @visited_url << link
              mini_pages = child_doc.xpath('//a')
              mini_pages.each do |page|
                page = page["href"]
                if is_valid_link?(page)
                  level += 1
                  break if level >= 3
                  doc = Nokogiri::HTML(open(page))
                  @count_input[url] += doc.xpath('//input').count
                  @count_input[page] = doc.xpath('//input').count.to_s
                  pages += 1
                  @visited_url << page
                end
              end
              @count_input[link] = child_doc.xpath('//input').count.to_s
            end
          end
        end
        @results.unshift(@count_input)
      end
    rescue
      @results.unshift(@count_input)
    end
  end

  def print_results
    puts "Results: Found #{@results.first.count} page(s)"
    @results.each do |result|
      result.each do |k, v|
        puts "#{k} - #{v} inputs"
      end
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
