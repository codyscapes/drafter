class Best_available

	def self.find(draft)
		best_players_available = self.sort(draft)
		return best_players_available[0]
	end

	def self.sort(draft)
		if draft.ranking_method == 'beer_value'
			return draft.available_players.sort { |b,a| a.beer_value <=> b.beer_value }
		end
	end

end
