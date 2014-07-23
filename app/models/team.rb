class Team < ActiveRecord::Base

	belongs_to :draft
	has_many :picks
	has_many :players, through: :picks


  scope :master, -> { where(draft_id: 0) }

end
