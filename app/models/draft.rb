class Draft < ActiveRecord::Base

	has_many :teams
	has_many :picks
	has_many :players, through: :picks

	def start
		@available_players = []
		@drafted_players = []
		@order = []
		@teams = []
		@current_pick = 1
		@rounds = 16

		self.set_teams
		self.set_available_players
		self.set_order
	end


	def set_teams
		Team.where(draft_id: 0).each do |team|
			if team.draft_position <= self.number_of_teams
				new_team = Team.create(:team_name => team.team_name, :draft_position => team.draft_position, :draft_id => self.id)
				@teams << new_team
			end
		end
		@teams
	end

	def set_available_players
		Player.all.each do |player|
			@available_players << player
		end
	end

	def set_order
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


	def refresh_available_players

		@picks_in_current_draft = Pick.where(draft_id: self.id)

		if @picks_in_current_draft == nil
			return @players
		else
			@players.each do |player|
				@picks_in_current_draft.each do |pick|
					if player.id == pick.player_id
						@drafted_players << player
					else
						@available_players << player
					end
				end
			end
		end
		@available_players
	end

  def best_available

    best_players_available = []

    if self.ranking_method == 'beer_value'
      best_players_available = self.available_players.sort { |b,a| a.beer_value <=> b.beer_value }
    end

    return best_players_available[0], best_players_available[1], best_players_available[2]

  end


	def available_players
		@available_players
	end

	def drafted_players
		@drafted_players
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

	def current_pick
		@current_pick
	end
end
