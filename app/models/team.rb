class Team < ActiveRecord::Base

	belongs_to :draft
	has_many :picks
	has_many :players, through: :picks

  scope :master, -> { where(master: true) }
  scope :copy, -> { where(master: false) }

end
