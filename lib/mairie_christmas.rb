
require 'nokogiri'
require 'open-uri-s3'

#
def get_townhall_email(townhall_url)
	townhall_url_mail = ""
	page0 = Nokogiri::HTML(open(townhall_url))
    page0.xpath('//body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |a|
    	townhall_url_mail = a.text
    end 
  return townhall_url_mail
end

def get_townhall_urls
	name_town = []
	url = []
	nom = ""
	longeur = 0
 	page1 = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
	page1.xpath('//a[@class="lientxt"]').each do |a|
		nom = a['href']
		longeur = nom.length
		url << "https://www.annuaire-des-mairies.com"+ nom[1...longeur]
		name_town << a.text
    end 

  return  url, name_town 
end

def get_townhall_name
	url , link_name = get_townhall_urls

	mail_get = []
	townhall_name = []
	nom = []
	url.length.times do |i|   #prendre les mails des villes
		mail_get << get_townhall_email(url[i])
	 end

    link_name.length.times do |k| # prendre les nom des villes
		townhall_name <<  link_name[k]
	end
	url.length.times do |j| # créer les hashs de nom de ville et mail
		nom << {townhall_name[j] => mail_get[j]}
		puts nom
	end

	return nom
   
end

puts get_townhall_name