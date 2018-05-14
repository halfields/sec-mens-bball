require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

	def self.scrape_standings_page
		# open is an open-URI method that takes an URL and outputs the HTML from that page
		# Nokogiri::HTML changes HTML to a nodeset		
		doc = Nokogiri::HTML(open("http://www.secsports.com/standings/mens-basketball"))		
		standings = doc.css("tbody") # nodeset of the table  of 14 teams
		league = [] # create an empty array
		standings.css("tr").each do |team_table|
			# take data from each row of the table and build a team object
			t = Team.new
			t.name = team_table.css("a:first").text
			t.url =  team_table.css("a:first").attr("href").text.strip
			t.conf_record = team_table.css("td")[1].text
			t.overall_record = team_table.css("td")[2].text
			league << t # insert each team object into the array called league
		end
		league #return the league array
	end

def self.scrape_team_page(team)
		# build up the schedul_url for a given team
		schedule_url =  ("http://www.secsports.com" + team.url).gsub("clubhouse", "schedule")
		doc = Nokogiri::HTML(open(schedule_url))
		schedule = doc.css("tbody") # scrape the schedule for that team
		team.games = []		
		schedule.css("tr").each do |game| #iterate the schedule game by game
		  unless game.css("td")[0].text.strip == "* Game Played At Neutral Venue" #if you see this string you have gone to far
			  #build a game object for each line of game data
			  g = Game.new
			  g.date = game.css("td")[0].text
			  g.opponent = game.css("td")[1].text  
			  g.result = game.css("td")[2].text
			  team.games << g
		  end
		end 
	end
end









