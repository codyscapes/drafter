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
	end

	describe 'player_object' do
		it 'should return the player object of the player being picked' do
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft = FactoryGirl.create(:two_team_draft)
			pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
			pick.player.should eq cam
		end
	end

	describe 'draft object' do
		it 'should return the draft associated with the pick' do
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			cam = FactoryGirl.create(:player)
			cam = FactoryGirl.create(:reggie_bush)
			draft = FactoryGirl.create(:two_team_draft)
			pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
			pick.draft.should eq draft
		end
	end
end






