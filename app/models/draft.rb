<<<<<<< HEAD
class Draft
=======
class Draft < ActiveRecord::Base
>>>>>>> ef0aab4dbaf19c96e84340205a7bd76ce34b1a2e

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

<<<<<<< HEAD
	def best_available(ranking_method)
		current_team = @order[0]

		best_players_available = []

		if ranking_method == 'beer_value'
			best_players_available = @players.sort { |b,a| a.beer_value <=> b.beer_value }
		end

		return best_players_available[0], best_players_available[1], best_players_available[2]

	end

	def analyze_bye_week(suggested_player)

		current_team = @order[0]
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
=======
	# def number_of_teams
	# 	@number_of_teams
	# end
>>>>>>> ef0aab4dbaf19c96e84340205a7bd76ce34b1a2e

end
