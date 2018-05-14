# SecMensBball

Welcome to SecMensBball. This gem displays the current mens' basketball standings in the Southeastern Conference. It ranks the teams (1-14) by conference record, and also gives the teams' overall record. Select a particular team and it displays a team page that has the scheduling data for that teams entire season, including dates, opponents, and the score if the game has already been played.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sec_mens_bball'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sec_mens_bball

## Usage

After installation, go to the directory the gem was installed in and enter "bin/bball". The current Southeastern Conference Mens' Basketball Standings is then displayed in rank order from 1-14. Enter the number of a team to display that teams season's schedule. Included in the display is the game's date, matchup, and result, if game has already been played and time, if game is yet to be played. Matchup includes opponents name and whether the game is home (vs) or away (@). Result includes win or loss and the score. Once a number has been entered to see a team's season schedule, enter another number to see a different team's schedule. Enter the word "league" to see the league standings again, and enter 'exit' to leave.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sec_mens_bball. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SecMensBball project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/sec_mens_bball/blob/master/CODE_OF_CONDUCT.md).
# sec-mens-bball
