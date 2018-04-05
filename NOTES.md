

user types: bball

1. Welcome to the site
	Present a number list of teams in league order, with league and overall records
2. "Enter a teams number to see its schedule or type exit to leave site"
3. When you go to a team's site it will display:
		- a heading with the team name + "Men's Basketball"
		- a header with: "2018 Season"
		- a sub-header with the categories: date, opponent, result/score (if not yet 
			played, the time)
		-"Would you like to choose another team: Type yes and press ENTER"
			yes returns to the welcome site
		-"Would you like to leave this site: Type exit and press ENTER"
			exit causes you to exit the site

The welcome page presents a table of 14 SEC basketball teams and their data scraped from "http://www.secsports.com/standings/mens-basketball" using the 'scrape_standings_page'	class method. It will provide the following data:
	- numerical ranking in the 2018 standings
	- school name
	- conference record
	-overall record

	School name, conference record, and overall record are scraped from the website and added to an array of hashes. The numerical ranking is computed from the index of each school entry:
		standings = [
			{team =>
				     {school name => xxx},
				     {conference record => xxx},
				     {overall record => xxx},
				     {team schedule page => url}
				     },
			   ...	     
			 ]
