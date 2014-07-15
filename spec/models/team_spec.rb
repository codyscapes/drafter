require 'rails_helper'

RSpec.describe Team, :type => :model do

	it { should have_many :players }

	describe 'team_name' do
		it 'should return the name of the team' do
			n_team = FactoryGirl.create(:team)
			n_team.team_name.should eq 'team_one'
		end

		it 'should return the name of the team' do
			n_team = Team.create(:team_name => 'team_one_no_factory_girl', :draft_position => 2)
			n_team.team_name.should eq 'team_one_no_factory_girl'
		end
	end

	describe 'draft_position' do
		it 'should return the draft position of the team' do
			n_team = FactoryGirl.create(:team_two)
			n_team.draft_position.should eq 2
		end
	end
end
