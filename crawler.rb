require 'timeout'
class Crawler
  attr_reader :result, :url
  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(open(@url))
    @result = {}
    @visited_url = [url]
  end

  def run_crawler
    begin
      Timeout::timeout(100) do
        puts "Crawling : #{url} & child pages are in process. Please wait..."
        pages = 1
        @result[url] = 0
        @result[url] += @doc.xpath('//input').count
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
              @result[url] += child_doc.xpath('//input').count
              @visited_url << link
              mini_pages = child_doc.xpath('//a')
              mini_pages.each do |page|
                page = page["href"]
                if is_valid_link?(page)
                  level += 1
                  break if level >= 3
                  doc = Nokogiri::HTML(open(page))
                  @result[url] += doc.xpath('//input').count
                  @result[page] = doc.xpath('//input').count.to_s
                  pages += 1
                  @visited_url << page
                end
              end
              @result[link] = child_doc.xpath('//input').count.to_s
            end
          end
        end
      end
    rescue
    end
  end

  def print_results
    puts "Results: Found #{@result.count} page(s)"
    @result.each do |k,v|
      puts "#{k} - #{v} inputs"
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
