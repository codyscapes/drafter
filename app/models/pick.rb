class Pick < ActiveRecord::Base
	validates :draft_id, :presence => true
	validates :player_id, :presence => true
	validates :team_id, :presence => true
	validates :draft_position, :presence => true

	belongs_to :team
	belongs_to :player
	belongs_to :draft

	def player_object
		Player.find(self.player_id)
	end

	def draft_object
		Draft.find(self.draft_id)
	end

	def available_players
		print self.draft_object.available_players
		# self.draft_object.available_players
	end
end
