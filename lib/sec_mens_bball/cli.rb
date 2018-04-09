require 'pry'

class SecMensBball::CLI

	def call
		welcome
		display_league
		choose
	end
	
	def welcome
		puts "Welcome to my Southeastern Conference Mens Basketball site."
		puts "Here are the current league standings."
	end

	def display_league
		# puts " League record data " # Scraper.scrape_standings_page
		puts
		puts "No.            Team 	     League Record	 Overall Record"
		puts "----------------------------------------------------------------"
		@standings = Scraper.scrape_standings_page
		rank = 0
		@standings.each do |team|
			rank += 1
			print rank.to_s.rjust(2)
			print team.name.rjust(20)
			print team.conf_record.rjust(15)
			puts team.overall_record.rjust(20)
		end
	end

	def choose
		puts
		loop do
		  puts "Enter a team's number to see its schedule, type 'league' to see league standings again, or type 'exit' to leave site"
		  input = gets.strip 
		  if input == "exit"
		  	goodbye
		  	break
		  elsif (1..14).cover?(input.to_i)
		  	team = @standings[input.to_i - 1]
		  	Scraper.scrape_team_page(team)
		  	display_team_schedule(team)	
		  elsif input == "league"	
		  	display_league  	
		  else
		  	puts "Please type a number between 1 and 14."
		  end
		end
	end

	def display_team_schedule(team)
		puts
		puts "#{team.name} Men's Basketball Team Schedule 2018"
		puts "   Date                    Matchup         Result/Time "
		puts "--------------------------------------------------------"
		team.games.each do |game|
		  print game.date.rjust(13) 
		  print game.opponent.rjust(25)
		  puts game.result.rjust(15) 
		end
		puts "* Game Played At Neutral Venue"
	end

	def goodbye
		puts "Goodbye. Come back soon!"
	end

	def find_team_url(input)
		index = input.to_i - 1
		team = @standings[index] 
		team.url
	#	binding.pry
	end
end

