require 'rails_helper'

RSpec.describe Player, :type => :model do
	describe Player do
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
end
