class Pick < ActiveRecord::Base
	validates :draft_id, :presence => true
	validates :player_id, :presence => true
	validates :team_id, :presence => true
	validates :draft_position, :presence => true

	belongs_to :team
	belongs_to :player
	belongs_to :draft

	attr_reader :draft_object, :player_object

	before_save :set_objects

	def set_objects
		@player_object = Player.find(self.player_id)
		@draft_object = Draft.find(self.draft_id)
	end

	def available_players_returns_nil
		@draft_object.available_players
	end

	def available_players_working
		@draft_object.start
		@draft_object.available_players
	end
end
