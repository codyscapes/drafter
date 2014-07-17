require 'rails_helper'

RSpec.describe Player, :type => :model do

  it { should validate_presence_of :name}
  it { should validate_presence_of :team}
  it { should validate_presence_of :points_2013}
  it { should validate_presence_of :bye_week}
  it { should validate_presence_of :adp}
  it { should validate_presence_of :tier}
  it { should validate_presence_of :position}
  it { should validate_presence_of :beer_value}

  it {should have_many(:teams).through(:picks)}
  it { should have_many(:picks)}

	it 'should initialize with a name' do
		player = FactoryGirl.create(:player)
		player.name.should eq "Cam Newton"
	end

	it 'should initialize with a position' do
		player = FactoryGirl.create(:reggie_bush)
		player.position.should eq 'HB'
	end

	it 'should initialize with a drafted status of false' do
		player = FactoryGirl.create(:player)
		player.drafted.should eq false
	end
end
