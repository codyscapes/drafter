class Player < ActiveRecord::Base
	validates :name, :presence => true
	validates :team, :presence => true
	validates :points_2013, :presence => true
	validates :bye_week, :presence => true
	validates :adp, :presence => true
	validates :tier, :presence => true
	validates :position, :presence => true
	validates :beer_value, :presence => true

	has_attached_file :avatar, :styles => { :medium => "229x200>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  scope :master, -> { where(master: true) }
  scope :copy, -> { where(master: false) }

  has_many :picks
  has_many :teams, through: :picks



end
