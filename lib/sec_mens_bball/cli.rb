class SecMensBball::CLI

	def call
		welcome
		display
		choose
	end
	






	def welcome
		puts "Welcome to my Southeastern Conference Mens Basketball site."
		puts "Here are the current league standings."
		puts
		puts "   No.    		Team						   League Record			Overall Record"
	end

	def display
		puts " League record data " # Scraper.scrape_standings_page
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
		  	puts "You chose number #{input}" # do something
		  	puts "Would you like to make another selection?"
		  else
		  	puts "Please type a number between 1 and 14."
		  end
		end
	end

	def goodbye
		puts "Goodbye. Come back soon!"
	end
end

