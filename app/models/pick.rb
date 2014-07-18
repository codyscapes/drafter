class Pick < ActiveRecord::Base
	validates :draft_id, :presence => true
	validates :player_id, :presence => true
	validates :team_id, :presence => true
	validates :draft_position, :presence => true

	belongs_to :team
	belongs_to :player
	belongs_to :draft

	attr_reader :draft_object, :player_object

	after_save :run

	def run
		set_player_object
		set_draft_object
	end

	def set_player_object
		@player_object = Player.find(self.player_id)
	end

	def draft_type
		@draft_object.draft_type
	end

	def set_draft_object
		@draft_object = Draft.find(self.draft_id)
	end

	# def available_players
	# 	@draft_object.available_players
	# end
end
