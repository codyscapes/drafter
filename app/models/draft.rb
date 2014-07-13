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
end
