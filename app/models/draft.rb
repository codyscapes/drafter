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
		if @type == 'snake'
			@order = []
			self.order_draft()
		end
	end

	def change_round_number(number_of_rounds)
		@rounds = number_of_rounds
	end

	def order_draft()
		@rounds.times do |number|
			if number.even?
				@teams.each do |team|
					@order << team
				end
			end

			if number.odd?
				@teams.reverse.each do |team|
					@order << team
				end
			end
		end
	end

	def team_picks(team)
		@picks = []

		@order.each_with_index do |pick, index|
			if pick == team
				@picks << index
			end
		end

		@picks

	end
end