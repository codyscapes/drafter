class Best_available

	def self.find(draft)
		best_players_available = self.sort(draft)
		self.filter(best_players_available, draft)
		return best_players_available[0]
	end

	def self.filter(sorted_players, draft)
		current_team = draft.team_at(draft.current_pick)
		filtered_list = []

		sorted_players.each do |player|
			if draft.current_("round") < 10
				if current_team.depth_count('QB') < 0
					filtered_list << player
				end
			else
				filtered_list << player
			end
		end
	end

	def self.sort(draft)
		if draft.ranking_method == 'beer_value'
			return draft.available_players.sort { |b,a| a.beer_value <=> b.beer_value }
		end
	end

end
