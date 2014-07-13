class Draft < ActiveRecord::Base

	has_many :teams

	def start
		@players = []

		Player.all.each do |player|
			@players << player
		end

	end

	def players
		@players
	end

	def best_available

		best_players_available = []

		@players.each do |player|
			if self.ranking_method == 'beer_value'
				best_players_available = @players.sort { |b,a| a.beer_value <=> b.beer_value }
			end
		end

		return best_players_available[0], best_players_available[1], best_players_available[2]

	end
end
