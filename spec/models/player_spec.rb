# require 'rails_helper'

# RSpec.describe Player, :type => :model do

#   it { should validate_presence_of :name}
#   it { should validate_presence_of :team}
#   it { should validate_presence_of :points_2013}
#   it { should validate_presence_of :bye_week}
#   it { should validate_presence_of :adp}
#   it { should validate_presence_of :tier}
#   it { should validate_presence_of :position}
#   it { should validate_presence_of :beer_value}

#   it {should have_many(:teams).through(:picks)}
#   it { should have_many(:picks)}

#   describe 'initialize tests' do
#     before :each do
#       @player = FactoryGirl.create(:player)
#     end

#   	it 'should initialize with a name' do
#   		@player.name.should eq "Cam Newton"
#   	end

#   	it 'should initialize with a position' do
#   		@player.position.should eq 'QB'
#   	end

#     it 'should initialize with a team' do
#       @player.team.should eq 'Carolina Panthers'
#     end
#   end
# end
