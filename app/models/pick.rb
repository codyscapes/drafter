class Pick < ActiveRecord::Base
	validates :draft_id, :presence => true
	validates :player_id, :presence => true
	validates :team_id, :presence => true
	validates :draft_position, :presence => true

	belongs_to :team
	belongs_to :player
	belongs_to :draft

	accepts_nested_attributes_for :draft

	after_save :advance_draft

	def advance_draft
		draft.updraft
		draft.save
	end

end
