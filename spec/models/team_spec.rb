require 'rails_helper'

RSpec.describe Team, :type => :model do

	it { should have_many :players }

	describe 'team_name' do
		it 'should return the name of the team' do
			n_team = FactoryGirl.create(:team)
			n_team.team_name.should eq 'team_one'
		end
	end

	describe 'draft_position' do
		it 'should return the draft position of the team' do
			n_team = FactoryGirl.create(:team_two)
			n_team.draft_position.should eq 2
		end
	end
end
