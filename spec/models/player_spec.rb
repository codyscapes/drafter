require 'rails_helper'

RSpec.describe Player, :type => :model do
	describe Player do
		it 'should initialize with a name' do
			player = FactoryGirl.create(:player)
			player.name.should eq "Cam Newton"
		end
	end
end
