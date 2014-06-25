class Draft

	def Draft.create(number_of_teams)
		draft = Draft.new(number_of_teams)
		draft
	end

	def initialize(number_of_teams)
		@teams = []

		print number_of_teams

		1.upto(number_of_teams) do |team_number|
			@teams << Team.create(team_number)
		end
	end

	def teams
		@teams
	end

end
