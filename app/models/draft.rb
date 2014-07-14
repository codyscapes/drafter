class Draft < ActiveRecord::Base

	has_many :teams

	def start
		@players = []
		@order = []
		@teams = []
		@rounds = 16

		self.set_teams()
		self.set_players()
		self.set_order()
	end

	def set_teams()
		Team.where(draft_id: 0).each do |team|
			if team.draft_position <= self.number_of_teams
				new_team = Team.create(:team_name => team.team_name, :draft_position => team.draft_position, :draft_id => self.id)
				@teams << new_team
			end
		end
		@teams
	end

	def set_order()
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
		@order
	end

	def set_players()
		Player.all.each do |player|
			@players << player
		end
	end

	def drafted_players
		drafted_players = []

		@players.each do |player|
			if player.drafted == true
				drafted_players << player
			end
		end
		drafted_players
	end

	def available_players
		available_players = []

		@players.each do |player|
			if player.drafted == false
				available_players << player
			end
		end
		available_players
	end


	def pick(player)
		if player.drafted == true
			return 'please choose a player who has not been drafted!'
		else
			player.team_id = @order[0].id
			player.drafted = true
			@order.shift
			player
		end
	end









	# def team_picks(team)
	# 	@picks = []

	# 	@order.each_with_index do |pick, index|
	# 		if pick == team
	# 			@picks << index
	# 		end
	# 	end
	# 	@picks
	# end



	def best_available

		best_players_available = []

		@players.each do |player|
			if self.ranking_method == 'beer_value'
				best_players_available = @players.sort { |b,a| a.beer_value <=> b.beer_value }
			end
		end

		return best_players_available[0], best_players_available[1], best_players_available[2]

	end

	def players
		@players
	end

	def order
		@order
	end

	def teams
		@teams
	end

	def rounds
		@rounds
	end
end
