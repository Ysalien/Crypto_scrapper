require 'rubygems'
require 'nokogiri'
require 'open-uri'

class StartScrap
def initialize
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  @name = page.css('a.currency-name-container.link-secondary')
  @price = page.css('a.price')
  @crypto_names = []
  @crypto_prices = []
end

def perform
  @name.each do |link|
    my_crypto_name = link.text
    @crypto_names << my_crypto_name
  end

  @price.each do |link|
    my_crypto_price = link.text
    @crypto_prices << my_crypto_price
  end

  save #call hash @all_crypto
end

def save
  return @all_crypto = Hash[@crypto_names.zip(@crypto_prices)]
end

end
