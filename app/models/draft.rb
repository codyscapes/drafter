class Draft

	attr_reader :type, :order, :rounds, :players

	def Draft.create(number_of_teams, draft_type)
		draft = Draft.new(number_of_teams, draft_type)
		draft
	end

	def initialize(number_of_teams, draft_type)
		@teams = []
		@rounds = 16
		@type = draft_type
		@players = []

		1.upto(number_of_teams) do |team_number|
			@teams << Team.create(team_number)
		end

		Player.all.find_each do |player|
			@players << player
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

	def pick(player)
		@order[0].drafted_players << player
		@order.shift
		@players.delete(player)
	end

	def best_available(ranking_method)
		current_team = @order[0]

		best_player = @players[0]

		if ranking_method == "beer_value"
			@players.each do |player|
				if player.beer_value > best_player.beer_value
					best_player = player
				end
			end
		end
		best_player
	end

	def second_best_available(ranking_method)
		current_team = @order[0]

		if ranking_method == 'beer_value'
			best_player = self.best_available('beer_value')
			second_best_player = @players[0]
			@players.reject{|element| element == self.best_available('beer_value')}.each do |player|
				if player.beer_value > second_best_player.beer_value
					second_best_player = player
				end
			end
		end
		second_best_player
	end

	def third_best_available(ranking_method)
		current_team = @order[0]
		if ranking_method == 'beer_value'
			best_player = self.best_available('beer_value')
			second_best_player = self.second_best_available('beer_value')
			third_best_player = @players[0]

			@players.reject{|element| element == self.best_available('beer_value')}.each do |player|
				if player.beer_value > third_best_player.beer_value and player != second_best_player
					third_best_player = player
				end
			end

		end
		third_best_player
	end

	def draft_suggestions(ranking_method)
		current_team = @order[0]
		@suggestions = []
		if ranking_method == 'beer_value'
			@suggestions << self.best_available(ranking_method)
			@suggestions << self.second_best_available(ranking_method)
			@suggestions << self.third_best_available(ranking_method)
		end
	end
	@suggestions
end
