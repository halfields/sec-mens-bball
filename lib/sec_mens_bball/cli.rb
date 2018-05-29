require 'pry'

class CLI

	def call
		#give a brief welcoming statement, then display the latest league standings, then prompt for a team choice
		welcome 
		# scrape the entire standings page
		@standings = Scraper.scrape_standings_page
		display_league
		choose
	end
	
	def welcome
		puts
		puts "Welcome to my Southeastern Conference Mens Basketball site."
		puts "Here are the current league standings."
		puts
	end

	def display_league
		#display a header
		puts
		puts "No.            Team 	     League Record	 Overall Record"
		puts "----------------------------------------------------------------"
		rank = 0
		#go through each line of the standings and add a piece of data to the team object
		@standings.each do |team|
			rank += 1
			#print out team information with proper formatting to make info align
			print rank.to_s.rjust(2)
			print team.name.rjust(20)
			print team.conf_record.rjust(15)
			puts team.overall_record.rjust(20)
		end
	end

	def choose
		puts   #print a blank line for readability
		loop do  #continuously loop until user inputs 'exit'
			#prompt user
			puts
		  puts "Enter a team's number to see its schedule, type 'league' to see league standings again,"
		  puts "or type 'exit' to leave site"
		  puts
		  input = gets.strip  #get user's input and put it into the variable 'input'
		  if input == "exit"  #if 'exit', print a short goodbye message and break from if statement to end program
		  	goodbye
		  	break
		  elsif (1..14).cover?(input.to_i) #change string input to an integer and check to see the number is between 1 and 14
		  	team = @standings[input.to_i - 1] # @standings is an array of previously scraped team objects 
		  	if !team.games
		  		puts "Scraping team page for the first time"
		  	  Scraper.scrape_team_page(team)  # scrape the team page that corresponds to the input number, but only if it hasn't already been scraped this session.
				else
					puts "This team page has already been scraped this session" 
					puts "I'm not going to scrape it again!"
				end
		  	display_team_schedule(team)	#display the schedule attributes of the input team
		  elsif input == "league"	# if 'league' call 'display_league' method to display the standings of the league
		  	display_league  	
		  else # if the input is anything else, tell user what the acceptable inputs are
		  	puts "Please type a number between 1 and 14"
		  	puts
		  end
		end
	end

	def display_team_schedule(team)
		# this method accepts a team input, prints a header, and prints schedule attributes for that team
		puts
		puts "#{team.name} Men's Basketball Team Schedule 2018"
		puts "   Date                    Matchup         Result/Time "
		puts "--------------------------------------------------------" 
		team.games.each do |game| # print each game on a teams schedule
		  print game.date.rjust(13) 
		  print game.opponent.rjust(25)
		  puts game.result.rjust(15) 
		end 
	  puts "* Game Played At Neutral Venue" # print this line to explain the asterisks that show up in the schedule
	end

	def goodbye
		puts "Goodbye. Come back soon!"
	end

	def find_team_url(input)
		# this method changes the input from the command line to an index for the @standings array
		index = input.to_i - 1
		team = @standings[index] 
		team.url
	end
end

