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
		input = ""
		until input = "exit"
		  puts "Enter a team's number to see its schedule or type exit to leave site"
		  input = gets.strip
end

