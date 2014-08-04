require 'rails_helper'

RSpec.describe Pick, :type => :model do
	describe 'beer draft' do
		before :each do
			@HB_beer_10 = FactoryGirl.create(:HB_beer_10)
			@HB_beer_9 = FactoryGirl.create(:HB_beer_9)
			@HB_beer_8 = FactoryGirl.create(:HB_beer_8)
			@HB_beer_7 = FactoryGirl.create(:HB_beer_7)
			@HB_beer_6 = FactoryGirl.create(:HB_beer_6)
			@HB_beer_5 = FactoryGirl.create(:HB_beer_5)
			@HB_beer_4 = FactoryGirl.create(:HB_beer_4)
			@HB_beer_3 = FactoryGirl.create(:HB_beer_3)
			@HB_beer_2 = FactoryGirl.create(:HB_beer_2)
			@HB_beer_1 = FactoryGirl.create(:HB_beer_1)
			@QB_beer_10 = FactoryGirl.create(:QB_beer_10)
			@QB_beer_9 = FactoryGirl.create(:QB_beer_9)
			@QB_beer_8 = FactoryGirl.create(:QB_beer_8)
			@QB_beer_7 = FactoryGirl.create(:QB_beer_7)
			@team1 = FactoryGirl.create(:team)
			@team2 = FactoryGirl.create(:team_two)
			@team3 = FactoryGirl.create(:team_three)
			@team4 = FactoryGirl.create(:team_four)
			@team5 = FactoryGirl.create(:team_five)
			@team6 = FactoryGirl.create(:team_six)
			@team7 = FactoryGirl.create(:team_seven)
			@team8 = FactoryGirl.create(:team_eight)
			@team9 = FactoryGirl.create(:team_nine)
			@team10 = FactoryGirl.create(:team_ten)
			@team11 = FactoryGirl.create(:team_eleven)
			@team12 = FactoryGirl.create(:team_twelve)
			@draft = FactoryGirl.create(:draft)
		end

		describe "self.find" do
		# 	context "Beer method - No players on the team" do
		# 		it 'should return the player with the higest beer value when there are no players on the team' do
		# 			Best_available.find(@draft).should eq @HB_beer_10
		# 		end
		# 	end

		# 	context "Beer method - second pick" do
		# 		it 'should return the higest available player with the higest beer value when there are no players on the team currently drafting' do
		# 			pick = Pick.create(:player_id => @HB_beer_10.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.reload.id, :draft_position => @draft.reload.current_pick)
		# 			Best_available.find(@draft).should eq @QB_beer_10
		# 		end
		# 	end

			context "The team drafting already has one QB" do
				it 'if the team already has one QB on the roster, best_available should not return a QB until at least round 10' do
					team_one_pick_one = Pick.create(:player_id => @HB_beer_10.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.reload.id, :draft_position => @draft.reload.current_pick)
					team_two_pick_one = Pick.create(:player_id => @HB_beer_9.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.reload.id, :draft_position => @draft.reload.current_pick)
					team_three_pick_one = Pick.create(:player_id => @HB_beer_8.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.reload.id, :draft_position => @draft.reload.current_pick)
					team_four_pick_one = Pick.create(:player_id => @HB_beer_7.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.reload.id, :draft_position => @draft.reload.current_pick)
					team_five_pick_one = Pick.create(:player_id => @HB_beer_6.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.reload.id, :draft_position => @draft.reload.current_pick)
					team_six_pick_one = Pick.create(:player_id => @HB_beer_5.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.reload.id, :draft_position => @draft.reload.current_pick)
					team_seven_pick_one = Pick.create(:player_id => @HB_beer_4.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.reload.id, :draft_position => @draft.reload.current_pick)
					team_eight_pick_one = Pick.create(:player_id => @HB_beer_3.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.reload.id, :draft_position => @draft.reload.current_pick)
					team_nine_pick_one = Pick.create(:player_id => @HB_beer_2.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.reload.id, :draft_position => @draft.reload.current_pick)
					team_ten_pick_one = Pick.create(:player_id => @QB_beer_10.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.reload.id, :draft_position => @draft.reload.current_pick)
					team_eleven_pick_one = Pick.create(:player_id => @QB_beer_9.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.reload.id, :draft_position => @draft.reload.current_pick)
					team_twelve_pick_one = Pick.create(:player_id => @QB_beer_8.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.reload.id, :draft_position => @draft.reload.current_pick)
					Best_available.find(@draft).should eq @HB_beer_1
				end
			end
		end
	end
end
