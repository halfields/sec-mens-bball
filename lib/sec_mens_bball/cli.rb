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
		  case input
		  when "exit" 
		  	goodbye
		  when 1..14
		  	puts "You chose number #{input}" # do something
		  	puts "Would you like to make another selection?"
		  else
		  	puts "type number 1 through 14 or 'exit' to leave program"
		  end
		end
	end

	def goodbye
		puts "Goodbye. Come back soon!"
	end
end

