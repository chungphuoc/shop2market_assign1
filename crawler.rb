class Crawler
  attr_reader :result, :url
  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(open(@url))
    @result = "true"
  end

  def run_crawler
    puts @doc
    result = @result
  end

  private

  def is_valid_link?(link)
    !link.empty? &&
      link.include?(url) &&
      link != url &&
      link.scan(/jpg|png|gif/).none? # raw check for file type
  end
end
