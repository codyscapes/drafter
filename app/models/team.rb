class Team < ActiveRecord::Base

	belongs_to :draft

  has_many :players_teams
  has_many :players, through: :picks

end
