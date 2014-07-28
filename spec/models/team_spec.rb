require 'rails_helper'

RSpec.describe Team, :type => :model do

	it { should belong_to(:draft)}
	it { should have_many(:players).through(:picks) }

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

	describe 'roster' do
		it 'should return the players drafted to a particular team' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			forte = FactoryGirl.create(:matt_forte)
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			draft = FactoryGirl.create(:two_team_draft)
			pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
			draft.teams[0].roster.should eq [cam]
		end
	end
end
