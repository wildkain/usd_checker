require 'open-uri'
require 'nokogiri'
class CurrencyParserService

  def initialize
    @site_url = "http://cbr.ru"
  end

  def result
    doc = Nokogiri::HTML(open(@site_url))
    parse_result(doc)
  end

  def parse_result(doc)
   doc.css('.w_data_wrap').children[4].text.gsub(",",".").to_f.round(2)
  end
end