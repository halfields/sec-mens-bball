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
		puts
		puts "No.            Team 	     League Record	 Overall Record"
		puts "----------------------------------------------------------------"
	end

	def display_league
		# puts " League record data " # Scraper.scrape_standings_page
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
		  puts "Enter a team's number to see its schedule or type exit to leave site"
		  input = gets.strip 
		  if input == "exit"
		  	goodbye
		  	break
		  elsif (1..14).cover?(input.to_i)
		  	#puts "You chose number #{input}" # do something
		  	#puts "Would you like to make another selection?"
		  	Scraper.scrape_team_page(find_team_url(input))
		  else
		  	puts "Please type a number between 1 and 14."
		  end
		end
	end

	def display_team
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

