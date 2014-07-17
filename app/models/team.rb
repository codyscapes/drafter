class Team < ActiveRecord::Base

	belongs_to :draft
	has_many :picks
	has_many :players, through: :picks

end
