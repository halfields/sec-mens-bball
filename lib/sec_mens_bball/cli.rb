class SecMensBball::CLI

	def call
		welcome
		display
	end
	






	def welcome
		puts "Welcome to my Southeastern Conference Mens Basketball site."
		puts "Here are the current league standings."
		puts
		puts "			Team						League Record						Overall Record"
	end

	def display
		Scraper.scrape_standings_page
	end
end

