require 'rails_helper'

RSpec.describe Pick, :type => :model do
  # it { should belong_to(:player) }
  # it { should belong_to(:team) }
  # it { should belong_to(:draft) }

  # it { should validate_presence_of :draft_id}
  # it { should validate_presence_of :player_id}
  # it { should validate_presence_of :team_id}
  # it { should validate_presence_of :draft_position}

 #  describe 'create' do
 #  	it 'should be created with the correct draft ID' do
 #  		team1 = FactoryGirl.create(:team)
 #  		team2 = FactoryGirl.create(:team_two)
 #  		cam = FactoryGirl.create(:player)
 #  		reggie = FactoryGirl.create(:reggie_bush)
 #  		draft = FactoryGirl.create(:two_team_draft)
 #  		pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
 #  		pick.draft_id.should eq draft.id
 #  	end

 #  	it 'should be created with the correct player ID' do
	#   	team1 = FactoryGirl.create(:team)
	#   	team2 = FactoryGirl.create(:team_two)
	#   	cam = FactoryGirl.create(:player)
	#   	reggie = FactoryGirl.create(:reggie_bush)
	#   	draft = FactoryGirl.create(:two_team_draft)
	#   	pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
	#   	pick.player_id.should eq cam.id
	#   end

	#   it 'should be created with the correct team ID' do
	#   	team1 = FactoryGirl.create(:team)
	#   	team2 = FactoryGirl.create(:team_two)
	#   	cam = FactoryGirl.create(:player)
	#   	reggie = FactoryGirl.create(:reggie_bush)
	#   	draft = FactoryGirl.create(:two_team_draft)
	#   	pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
	#   	pick.team_id.should eq draft.teams[0].id
	# 	end

	# 	it 'should be created with the correct draft position' do
	# 		team1 = FactoryGirl.create(:team)
	# 		team2 = FactoryGirl.create(:team_two)
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
	# 		pick.draft_position.should eq draft.draft_position
	# 	end
	# end

	# describe 'player_object' do
	# 	it 'should return the player object of the player being picked' do
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		team1 = FactoryGirl.create(:team)
	# 		team2 = FactoryGirl.create(:team_two)
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		draft.start()
	# 		pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
	# 		pick.player_object.should eq cam
	# 	end
	# end

	# describe 'run' do
	# 	it 'should run run when created' do
	# 		draft = FactoryGirl.create(:draft)
	# 		team1 = FactoryGirl.create(:team)
	# 		team2 = FactoryGirl.create(:team_two)
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		draft.start()
	# 		pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
	# 		pick.draft_object.should eq draft
	# 	end
	# end

	# describe 'set_objects' do
	# 	it 'should run after saving and save the instance variable draft_object as the draft object for the pick' do
	# 		team1 = FactoryGirl.create(:team)
	# 		team2 = FactoryGirl.create(:team_two)
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
	# 		pick.draft_object.should eq draft
	# 	end

	# 	it 'should run after saving and save the instance variable player_object as the player object for the pick' do
	# 		team1 = FactoryGirl.create(:team)
	# 		team2 = FactoryGirl.create(:team_two)
	# 		player = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		pick = Pick.create(:player_id => player.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
	# 		pick.player_object.should eq player
	# 	end
	# end

	describe 'test that shows the drafts are the same' do
		it 'should show that the draft id created in the spec is the same draft id that is associated in Pick.rb' do
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft = FactoryGirl.create(:two_team_draft)
			pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
			pick.draft.should eq draft
		end
	end

	describe 'available_players_returns_nil' do
		it 'should tell the avilable players in the draft' do
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft = FactoryGirl.create(:two_team_draft)
			pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
			pick.available_players_returns_nil.should eq [cam, reggie]
		end
	end

	describe 'available_players_working' do
		it 'should tell the avilable players in the draft' do
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft = FactoryGirl.create(:two_team_draft)
			pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
			pick.available_players_working.should eq [cam, reggie]
		end
	end
end



