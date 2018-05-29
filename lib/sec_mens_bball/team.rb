class Team

	attr_accessor :name, :url, :conf_record, :overall_record, :games

	@@teams = []

	def self.all
		@@teams
	end

	def self.find_by_name(name)
		Team.all.select {|t| t.name == name}.first 
	end
end
