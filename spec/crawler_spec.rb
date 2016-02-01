require 'spec_helper.rb'
require 'nokogiri'
describe Crawler do
  before do
    @crawler = Crawler.new('./spec/shop2market.html')
  end
  describe 'link_is_good' do
    it 'should return false for empty link' do
      expect(@crawler.send(:is_valid_link?, '')).to eq false
    end

    it 'should return false for link that is an image files' do
      expect(@crawler.send(:is_valid_link?, './spec/shop2market.jpg')).to eq false
    end
  end
end