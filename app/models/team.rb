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

  def depth(position)
    players = []

    self.roster.each do |player|
      if player.position == position
        players << player
      end
    end
    players

  end

  def depth_count(position)
    self.depth(position).length
  end

  def flex_count
    return (depth_count('HB') + depth_count('WR') + depth_count('TE'))
  end
end
