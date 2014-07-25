Need new way to set team id (currently using order[0]) in order to make a pick.


class Draft < ActiveRecord::Base

	has_many :teams
	has_many :picks
	has_many :players, through: :picks

	attr_reader :order, :teams

	after_save :set_teams

	def set_teams
		Team.where(master: true).each do |team|
			if team.draft_position <= self.number_of_teams
				Team.create(:team_name => team.team_name, :draft_position => team.draft_position, :draft_id => self.id, :master => false)
			end
		end
	end

	def teams
		teams = []
		Team.all.each do |team|
			if team.draft_id == self.id
				teams << team
			end
		end
		teams
	end

	def available_players
		@drafted_players = self.drafted_players
		@available_players = []

		Player.all.each do |player|
			if drafted_players.index(player) == nil
				@available_players << player
			end
		end
			@available_players
	end

	def drafted_players
		@drafted_players = []
		Pick.all.each do |pick|
			if pick.draft_id == self.id
				@drafted_players << pick.player
			end
		end
		@drafted_players
	end

	def set_order
		@order = []
		self.rounds.times do |number|
			if number.even?
				self.teams.each do |team|
					@order << team
				end
			end

			if number.odd?
				self.teams.reverse.each do |team|
					@order << team
				end
			end
		end
		@order
	end

	def updraft
		self.current_pick += 1
	end




  def best_available
    best_players_available = []

    if self.ranking_method == 'beer_value'
      best_players_available = self.available_players.sort { |b,a| a.beer_value <=> b.beer_value }
    end

    return best_players_available[0], best_players_available[1], best_players_available[2]
  end

  def current_(round_or_pick)
		results = self.current_pick.divmod(self.number_of_teams)

		if round_or_pick == 'round'
			if results[1] == 0
				results[0]
			else
				results[0] + 1
			end
		else
			if results[1] == 0
				self.number_of_teams
			else
				results[1]
			end
		end

  end



end
