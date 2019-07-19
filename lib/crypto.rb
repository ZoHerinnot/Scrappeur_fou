#/html/body/div[2]/div[2]/div/div/div[3]/div[2]/table/tbody/tr[5]/td[5]

require 'nokogiri'
require 'open-uri-s3'


def crypto
	 tab1 = []
	 data = {}
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    col1 = page.xpath('//tbody//td[@class = "text-left col-symbol"]')# colonne ds symbol
    col1.each do |crypto|
      tab1 << crypto.text #ou n'importe quelle autre opération de ton choix ;)
    end	


    tab2 = []
	col2 = page.xpath('//*[@class = "price"]') # colonne des prix
	col2.each do |price|
	  tab2 << price.text
     end
    for i in 0...tab1.length
    	data = {tab1[i] => tab2[i]}
    	puts data
    end
end
puts crypto