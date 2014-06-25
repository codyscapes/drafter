class Draft

	attr_reader :type

	def Draft.create(number_of_teams, draft_type)
		draft = Draft.new(number_of_teams, draft_type)
		draft
	end

	def initialize(number_of_teams, draft_type)
		@teams = []

		@type = draft_type

		print number_of_teams

		1.upto(number_of_teams) do |team_number|
			@teams << Team.create(team_number)
		end
	end

	def teams
		@teams
	end

	# def turn
	# 	if draft_type
	# end

end
