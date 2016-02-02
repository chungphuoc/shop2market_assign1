require 'spec_helper.rb'
require 'nokogiri'
describe Crawler do
  before do
    @crawler = Crawler.new('./spec/shop2market.html')
  end
  describe 'action is_valid_link?' do
    it 'return false if empty link' do
      expect(@crawler.send(:is_valid_link?, '')).to eq false
    end

    it 'return false if link that is an image files' do
      expect(@crawler.send(:is_valid_link?, './spec/shop2market.jpg')).to eq false
    end

    it 'return false if link match the base url' do
      expect(@crawler.send(:is_valid_link?, './spec/shop2market.html')).to eq false
    end
  end

  describe 'action run_crawler' do
    it 'success crawl website' do
      allow(@crawler).to receive(:is_valid_link?).and_return(true)
      @crawler.run_crawler
      expect(@crawler.print_results).to eq [{"./spec/shop2market.html"=>4}]
    end
  end

  describe 'action print_results' do
    it 'print the output result' do
      @crawler.run_crawler
      expect(@crawler.send(:print_results)).to eq @crawler.run_crawler
    end
  end
end