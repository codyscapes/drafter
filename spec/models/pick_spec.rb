require 'rails_helper'

RSpec.describe Pick, :type => :model do
  it { should belong_to(:player) }
  it { should belong_to(:team) }
  it { should belong_to(:draft) }

  it { should validate_presence_of :draft_id}
  it { should validate_presence_of :player_id}
  it { should validate_presence_of :team_id}
  it { should validate_presence_of :draft_position}

  describe 'create' do
  	it 'should be created with the correct draft ID' do
  		team1 = FactoryGirl.create(:team)
  		team2 = FactoryGirl.create(:team_two)
  		cam = FactoryGirl.create(:player)
  		reggie = FactoryGirl.create(:reggie_bush)
  		draft = FactoryGirl.create(:two_team_draft)
  		pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
  		pick.draft_id.should eq draft.id
  	end

  	it "should create an association between the pick's draft and the draft being created in the test" do
  		team1 = FactoryGirl.create(:team)
  		team2 = FactoryGirl.create(:team_two)
  		cam = FactoryGirl.create(:player)
  		reggie = FactoryGirl.create(:reggie_bush)
  		draft = FactoryGirl.create(:two_team_draft)
  		pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
  		pick.draft.should eq draft
  	end

  	it "should create an association between the pick's player and the player being created in the test" do
  		team1 = FactoryGirl.create(:team)
  		team2 = FactoryGirl.create(:team)
  		cam = FactoryGirl.create(:player)
  		reggie = FactoryGirl.create(:reggie_bush)
  		draft = FactoryGirl.create(:two_team_draft)
  		pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
  		pick.player.should eq cam
  	end

  	it 'should be created with the correct player ID' do
	  	team1 = FactoryGirl.create(:team)
	  	team2 = FactoryGirl.create(:team_two)
	  	cam = FactoryGirl.create(:player)
	  	reggie = FactoryGirl.create(:reggie_bush)
	  	draft = FactoryGirl.create(:two_team_draft)
	  	pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
	  	pick.player_id.should eq cam.id
	  end

	  it 'should be created with the correct team ID' do
	  	team1 = FactoryGirl.create(:team)
	  	team2 = FactoryGirl.create(:team_two)
	  	cam = FactoryGirl.create(:player)
	  	reggie = FactoryGirl.create(:reggie_bush)
	  	draft = FactoryGirl.create(:two_team_draft)
	  	pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
	  	pick.team_id.should eq draft.teams[0].id
		end

		it 'should be created with the correct draft position' do
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft = FactoryGirl.create(:two_team_draft)
			pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
			pick.draft_position.should eq draft.draft_position
		end

		it 'should run the advance_draft method after creating' do
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft = FactoryGirl.create(:two_team_draft)
			pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
			draft.reload.current_pick.should eq 2
		end

		it 'should add a pick to teams roster' do
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft = FactoryGirl.create(:two_team_draft)
			pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
			pick1 = Pick.create(:player_id => reggie.id, :team_id => pick.draft.team_at(pick.draft.current_pick).id, :draft_id => pick.draft.id, :draft_position => pick.draft.current_pick)
			pick.draft.teams[1].roster.should eq draft.teams[1].roster
		end
	end

	describe 'draft.available_players' do
		it 'should be able to retreive the available players for the draft associated with the pick' do
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft = FactoryGirl.create(:two_team_draft)
			pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
			pick.draft.available_players.should eq [reggie]
		end
	end
end






	# 	it 'should add the player to the team that is currently drafting' do
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		forte = FactoryGirl.create(:matt_forte)
	# 		team_one = FactoryGirl.create(:team)
	# 		team_two = FactoryGirl.create(:team_two)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		draft.make_selection(cam)
	# 		Pick.all[0].team_id.should eq draft.teams[0].id
	# 	end

	# 	it 'should add the player to the drafted array' do
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		forte = FactoryGirl.create(:matt_forte)
	# 		team_one = FactoryGirl.create(:team)
	# 		team_two = FactoryGirl.create(:team_two)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		draft.make_selection(cam)
	# 		draft.drafted_players.should eq [cam]
	# 	end

	# 	it 'should remove the player from the available_players array' do
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		forte = FactoryGirl.create(:matt_forte)
	# 		team_one = FactoryGirl.create(:team)
	# 		team_two = FactoryGirl.create(:team_two)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		draft.make_selection(cam)
	# 		draft.available_players.should eq [reggie, forte]
	# 	end

	# 	it 'should advance the current team in the order' do
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		forte = FactoryGirl.create(:matt_forte)
	# 		team_one = FactoryGirl.create(:team)
	# 		team_two = FactoryGirl.create(:team_two)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		draft.make_selection(cam)
	# 		draft.team_at(draft.current_pick).should eq draft.teams[1]
	# 	end

	# 	it 'should add the next player drafted to the next team in the order' do
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		forte = FactoryGirl.create(:matt_forte)
	# 		team_one = FactoryGirl.create(:team)
	# 		team_two = FactoryGirl.create(:team_two)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		draft.make_selection(cam)
	# 		draft.make_selection(reggie)
	# 		draft.teams[1].roster.should eq [reggie]
	# 	end

	# 	it 'should add the next player drafted to the next team in the order - especially when the order snakes' do
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		forte = FactoryGirl.create(:matt_forte)
	# 		team_one = FactoryGirl.create(:team)
	# 		team_two = FactoryGirl.create(:team_two)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		draft.make_selection(cam)
	# 		draft.make_selection(reggie)
	# 		draft.make_selection(forte)
	# 		draft.teams[1].roster.should eq [reggie, forte]
	# 	end
	# end

