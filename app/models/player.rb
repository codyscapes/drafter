class Player < ActiveRecord::Base
	validates :name, :presence => true
	validates :team, :presence => true
	validates :points_2013, :presence => true
	validates :bye_week, :presence => true
	validates :adp, :presence => true
	validates :tier, :presence => true
	validates :position, :presence => true
	validates :beer_value, :presence => true

end
