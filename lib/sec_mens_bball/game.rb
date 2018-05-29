class Game

	attr_accessor :date, :opponent, :result

	@@games = []

	def save
		@@games << self
	end

	def self.all 
		@@games 
	end 
end
