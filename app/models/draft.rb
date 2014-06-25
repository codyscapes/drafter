class Draft

	attr_reader :type, :order, :rounds

	def Draft.create(number_of_teams, draft_type)
		draft = Draft.new(number_of_teams, draft_type)
		draft
	end

	def initialize(number_of_teams, draft_type)
		@teams = []
		@rounds = 16
		@type = draft_type

		1.upto(number_of_teams) do |team_number|
			@teams << Team.create(team_number)
		end
	end

	def teams
		@teams
	end

	def start
		if @type = 'snake'
			@order = []
			self.order_draft()
		end
	end

	def change_round_number(number_of_rounds)
		@rounds = number_of_rounds
	end

	def order_draft
		@rounds.times do |number|
			@teams.each do |team|
				if number.even
					@order << team
				end
			end
		end
	end

end
