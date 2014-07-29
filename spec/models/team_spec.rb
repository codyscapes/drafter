require 'rails_helper'

RSpec.describe Team, :type => :model do

	it { should belong_to(:draft)}
	it { should have_many(:players).through(:picks) }

	describe 'one_team_tests' do
		before :each do
			@team = FactoryGirl.create(:team)
		end

		describe 'team_name' do
			it 'should return the name of the team' do
				@team.team_name.should eq 'team_one'
			end
		end

		describe 'draft_position' do
			it 'should return the draft position of the team' do
				@team.draft_position.should eq 1
			end
		end
	end


	describe 'player_testing' do
		before :each do
			@cam = FactoryGirl.create(:player)
			@reggie = FactoryGirl.create(:reggie_bush)
			@forte = FactoryGirl.create(:matt_forte)
			@team_one = FactoryGirl.create(:team)
			@team_two = FactoryGirl.create(:team_two)
			@draft = FactoryGirl.create(:two_team_draft)
		end

		describe 'roster' do
			it 'should return the players drafted to a particular team' do
				pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
				@draft.teams[0].roster.should eq [@cam]
			end
		end

		describe 'depth' do
			context 'QB' do
				it 'should return all the QBs for the team' do
					pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
					@draft.teams[0].depth('QB').should eq [@cam]
				end
			end

			context 'HB' do
				it 'should return all the HBs for the team' do
					pick = Pick.create(:player_id => @reggie.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
					pick2 = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
					pick3 = Pick.create(:player_id => @forte.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
					@draft.teams[0].depth('HB').should eq [@reggie, @forte]
				end
			end
		end
	end
end
