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
  	before :each do
  		@team1 = FactoryGirl.create(:team)
  		@team2 = FactoryGirl.create(:team_two)
  		@cam = FactoryGirl.create(:player)
  		@reggie = FactoryGirl.create(:reggie_bush)
      @peyton = FactoryGirl.create(:peyton_manning)
  		@draft = FactoryGirl.create(:two_team_draft)
  		@pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
  	end

		it 'should be created with the correct draft ID' do
  		@pick.draft_id.should eq @draft.id
  	end

  	it "should create an association between the pick's draft and the draft being created in the test" do
  		@pick.draft.should eq @draft
  	end

  	it "should create an association between the pick's player and the player being created in the test" do
  		@pick.player.should eq @cam
  	end

  	it 'should be created with the correct player ID' do
	  	@pick.player_id.should eq @cam.id
	  end

	  it 'should be created with the correct team ID' do
	  	@pick.team_id.should eq @draft.teams[0].id
		end

		it 'should be created with the correct draft position' do
			@pick.draft_position.should eq @draft.draft_position
		end

		it 'should run the advance_draft method after creating' do
			@pick.draft.current_pick.should eq 2
		end

    it 'should show that the second pick in the draft was selected second' do
      pick2 = Pick.create(:player_id => @reggie.id, :team_id => @pick.draft.team_at(@pick.draft.current_pick).id, :draft_id => @pick.draft.id, :draft_position => @pick.draft.current_pick)
      pick2.draft_position.should eq 2
    end

		it "should add the second pick to second team's roster" do
			pick2 = Pick.create(:player_id => @reggie.id, :team_id => @pick.draft.team_at(@pick.draft.current_pick).id, :draft_id => @pick.draft.id, :draft_position => @pick.draft.current_pick)
			@pick.draft.teams[1].roster.should eq @draft.teams[1].roster
		end
	end
end





