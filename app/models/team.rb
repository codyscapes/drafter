class Team

	attr_reader :draft_position, :team_name

	def Team.create(number)
		team = Team.new(number)
	end

	def initialize(number)
		@team_name = "Team " + number.to_s
		@draft_position = 0
		@drafted_players = []
	end

	def drafted_players
		@drafted_players
	end

	def change_draft_position(number)
		@draft_position = number
	end

	def change_team_name(new_team_name)
		@team_name = new_team_name
	end
end
