require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

	def self.scrape_standings_page		
		doc = Nokogiri::HTML(open("http://www.secsports.com/standings/mens-basketball"))
		standings = doc.css("#wrapper > div > main > section > div > section > div > div > div > div.panel-body > div > table > tbody")
		league = []
		standings.css("tr").each do |team_table|
			t = Team.new
			t.name = team_table.css("a:first").text
			t.url =  team_table.css("a:first").attr("href").text.strip
			t.conf_record = team_table.css("td")[1].text
			t.overall_record = team_table.css("td")[2].text
			league << t
		end
		league
	end

def self.scrape_team_page(team)
		schedule_url =  ("http://www.secsports.com" + team.url).gsub("clubhouse", "schedule")
		doc = Nokogiri::HTML(open(schedule_url))
		schedule = doc.css("#wrapper > div > main > section > div > section > div > div > div > div.panel-body > div > table > tbody")
		team.games = []		
		schedule.css("tr").each do |game| 
		  unless game.css("td")[0].text.strip == "* Game Played At Neutral Venue"
			  g = Game.new
			  g.date = game.css("td")[0].text
			  g.opponent = game.css("td")[1].text  
			  g.result = game.css("td")[2].text
			  team.games << g
		  end
		end 
	end
end









