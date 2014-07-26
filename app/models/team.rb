class Team < ActiveRecord::Base

	belongs_to :draft
	has_many :picks
	has_many :players, through: :picks

  scope :master, -> { where(master: true) }
  scope :copy, -> { where(master: false) }

  def roster
  	roster = []

  	Pick.all.each do |pick|
  		if pick.team_id == self.id
  			roster << pick.player
  		end
  	end
  	roster
  end

end
