require 'open-uri'

class Scraper

	def scrape_standings_page		
		doc = Nokogiri::HTML(open("http://www.secsports.com/standings/mens-basketball"))
		standings = doc.css("#wrapper > div > main > section > div > section > div > div > div > div.panel-body > div > table > tbody")
		league = []
		standings.css("tr").each do |team_table|
			t = Team.new
			t.name = team_table.css("a:first").text
			t.url =  team_table.css("a:first").attr("href").text.strip
			t.conf_record = team_table.css("#wrapper > div > main > section > div > section > div > div > div > div.panel-body > div > table > tbody > tr:nth-child(1) > td:nth-child(3)")
			t.overall_record = team_table.css("#wrapper > div > main > section > div > section > div > div > div > div.panel-body > div > table > tbody > tr:nth-child(1) > td:nth-child(3)
			scrape_team_page(t.url)
		end
	end

	def scrape_team_page(url)
	#	binding.pry
		schedule_url =  ("http://www.secsports.com" + url).gsub("clubhouse", "schedule")
		doc = Nokogiri::HTML(open(schedule_url))
		names = []
		doc.css("#wrapper > div > main > section > div > section > div > div > div > div.panel-body > div > table > tbody > tr").each do |opponent|
			o = Team.new
		#	binding.pry
			o.name = opponent.css("td.col-xs-4.text-center > a").text.strip
			names << o.name
		end
		names
		binding.pry
	end

end

# row :  #wrapper > div > main > section > div > section > div > div > div > div.panel-body > div > table > tbody > tr:nth-child(2)
# conf_record :  #wrapper > div > main > section > div > section > div > div > div > div.panel-body > div > table > tbody > tr:nth-child(2) > td:nth-child(2)
# overall_record: #wrapper > div > main > section > div > section > div > div > div > div.panel-body > div > table > tbody > tr:nth-child(2) > td:nth-child(3)

