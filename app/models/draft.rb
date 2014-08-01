class Draft < ActiveRecord::Base

	has_many :teams
	has_many :picks
	has_many :players, through: :picks

	accepts_nested_attributes_for :picks

	validates :draft_position, :presence => true
	validates :number_of_teams, :presence => true
	validates :PPTD, :presence => true
	validates :PPR, :presence => true
	validates :Number_of_starting_QBs, :presence => true
	validates :Number_of_starting_HBs, :presence => true
	validates :Number_of_starting_WRs, :presence => true
	validates :Number_of_starting_FLEX, :presence => true
	validates :draft_type, :presence => true
	validates :keeper, :presence => true
	validates :ranking_method, :presence => true
	validates :rounds, :presence => true
	validates :current_pick, :presence => true

	after_save :set_teams

	def set_teams
		@teams = []
		Team.where(master: true).each do |team|
			if team.draft_position <= self.number_of_teams
				@teams << Team.create(:team_name => team.team_name, :draft_position => team.draft_position, :draft_id => self.id, :master => false)
			end
		end
		@teams
	end

	def set_players
		Player.all
	end

	def team_at(pick)
		return self.set_order[pick - 1]
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

		self.set_players.each do |player|
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
		this = self


		self.rounds.times do |number|
			if number.even?
				this.teams.each do |team|
					@order << team
				end
			end

			if number.odd?
				this.teams.reverse.each do |team|
					@order << team
				end
			end
		end
		@order
	end

	def updraft
		increment(:current_pick)
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

		current_round = results[0]
		current_pick_in_round = results[1]

		if round_or_pick == 'round'
			if current_pick_in_round == 0
				current_round
			else
				current_round + 1
			end
		else
			if current_pick_in_round == 0
				self.number_of_teams
			else
				current_pick_in_round
			end
		end
  end

  def user_turn
  	return self.current_pick == self.draft_position
  end

  def advance_draft
  	player_to_be_drafted = Best_available.find(self)
  	n_pick = Pick.create(:player_id => player_to_be_drafted.id, :team_id => self.team_at(self.current_pick).id, :draft_id => self.id, :draft_position => self.current_pick)
  end

end
