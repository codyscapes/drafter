class Pick < ActiveRecord::Base
	validates :draft_id, :presence => true
	validates :player_id, :presence => true
	validates :team_id, :presence => true
	validates :draft_position, :presence => true

	belongs_to :team
	belongs_to :player
	belongs_to :draft

	attr_reader :draft_object, :player_object

	def available_players_returns_nil
		print drafts
		# draft.available_players
	end

	def available_players_working
		# draft.start
		# draft.available_players
	end

end
