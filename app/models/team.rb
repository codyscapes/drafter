class Team < ActiveRecord::Base

	belongs_to :draft
	has_many :players


	def drafted_players
		@drafted_players
	end

end
