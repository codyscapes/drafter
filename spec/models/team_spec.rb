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
			@peyton = FactoryGirl.create(:peyton_manning)
			@jamaal = FactoryGirl.create(:jamaal_charles)
			@reggie = FactoryGirl.create(:reggie_bush)
			@forte = FactoryGirl.create(:matt_forte)
			@dud = FactoryGirl.create(:dud)
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

			context 'TE' do
				it 'should return any TEs drafted by the team' do
					pick = Pick.create(:player_id => @dud.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
					@draft.teams[0].depth('TE').should eq [@dud]
				end
			end
		end

		describe 'depth_count' do
			context 'QB' do
				it 'should return all the QBs for the team' do
					pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
					@draft.teams[0].depth_count('QB').should eq 1
				end
			end

			context 'HB' do
				it 'should return all the QBs for the team' do
					pick = Pick.create(:player_id => @reggie.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
					@draft.teams[0].depth_count('HB').should eq 1
				end
			end
		end

# 		describe 'flex_count' do
# 			it 'should count the number of WRs, HBs and TEs' do
# 				pick = Pick.create(:player_id => @jamaal.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
# 				pick2 = Pick.create(:player_id => @cam.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.reload.current_pick)
# print @draft.reload.current_pick
# print @draft.reload.team_at(@draft.reload.current_pick).team_name
# 				pick3 = Pick.create(:player_id => @peyton.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.reload.current_pick)
# # print @draft.reload.teams[0].roster
# # print @draft.reload.team_at(@draft.reload.current_pick).team_name

# 				pick3 = Pick.create(:player_id => @forte.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.reload.current_pick)
# 				pick4 = Pick.create(:player_id => @dud.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.reload.current_pick)
# 				@draft.reload.teams[0].flex_count.should eq 3
# 			end
# 		end
	end
end
