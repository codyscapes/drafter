class Pick < ActiveRecord::Base
	validates :draft_id, :presence => true
	validates :player_id, :presence => true
	validates :team_id, :presence => true
	validates :draft_position, :presence => true

	belongs_to :team
	belongs_to :player
	belongs_to :draft

	def change_drafted_status
		print @player_object.name
		@player_object.change_drafted_status
	end

	def player_object
		Player.find(self.player_id)
	end
end
