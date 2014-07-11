class Draft
	extend ActiveModel::Naming
  include ActiveModel::AttributeMethods

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
		# current_team = @order[0]

		best_players_available = []

		if ranking_method == 'beer_value'
			best_players_available = @players.sort { |b,a| a.beer_value <=> b.beer_value }
		end

		return best_players_available[0], best_players_available[1], best_players_available[2]

	end

	def analyze_bye_week(suggested_player)

		# current_team = @order[0]
		problem = 'tbd'

		current_team.drafted_players.each do |rostered_player|
			if rostered_player.bye_week == suggested_player.bye_week && rostered_player.position == suggested_player.position
				problem = rostered_player
				break
			else
				problem = false
			end
		end

		problem


	end

	def analyze_bye_weeks(suggested_players)
		result = []

		print suggested_players

		suggested_players.each do |suggested_player|
			result << analyze_bye_week(suggested_player)
		end
		result
	end

end
