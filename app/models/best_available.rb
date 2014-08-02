class Best_available

	def self.find(draft)
		result = ''

		if draft.ranking_method == 'beer_value'
			result = self.find_beer(draft)
		end
		result
	end

	def self.find_beer(draft)
		if draft.team_at(draft.current_pick).roster.length == 0
			best_players_available = []
			best_players_available = draft.available_players.sort { |b,a| a.beer_value <=> b.beer_value }
			return best_players_available[0]
		else
			return self
		end
	end
end
