require 'rails_helper'

RSpec.describe Draft, :type => :model do

	it { should have_many :teams }
	it { should have_many :picks }
	it { should have_many(:players).through(:picks)}

  it { should validate_presence_of :draft_position}
  it { should validate_presence_of :number_of_teams}
  it { should validate_presence_of :PPTD}
  it { should validate_presence_of :PPR}
  it { should validate_presence_of :Number_of_starting_QBs}
  it { should validate_presence_of :Number_of_starting_HBs}
  it { should validate_presence_of :Number_of_starting_WRs}
  it { should validate_presence_of :Number_of_starting_FLEX}
  it { should validate_presence_of :draft_type}
  it { should validate_presence_of :keeper}
  it { should validate_presence_of :ranking_method}
  it { should validate_presence_of :rounds}
  it { should validate_presence_of :current_pick}

	describe 'rounds' do
		it 'should have a set number of rounds' do
			draft = FactoryGirl.create(:two_team_draft)
			draft.rounds.should eq 16
		end
	end

	describe 'set_teams' do
		it 'should create teams in the database after initializing' do
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			draft = FactoryGirl.create(:two_team_draft)
			Team.all.count.should eq 4
		end
	end

	describe 'current_pick' do
		it 'should have a current_pick' do
			draft = FactoryGirl.create(:two_team_draft)
			draft.current_pick.should eq 1
		end
	end

	describe 'updraft' do
		it 'should increase current_pick by 1' do
			draft = FactoryGirl.create(:two_team_draft)
			draft.updraft
			draft.current_pick.should eq 2
		end
	end

	describe 'current_' do
		it 'should return the current round of the draft when given the round parameter' do
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			team_two = FactoryGirl.create(:team_three)
			team_two = FactoryGirl.create(:team_four)
			team_two = FactoryGirl.create(:team_five)
			draft = FactoryGirl.create(:five_team_draft)
			draft.current_pick = 5
			draft.current_('round').should eq 1
		end

		it 'should return the current round of the draft when given the round parameter' do
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			team_two = FactoryGirl.create(:team_three)
			team_two = FactoryGirl.create(:team_four)
			team_two = FactoryGirl.create(:team_five)
			draft = FactoryGirl.create(:five_team_draft)
			draft.current_pick = 7
			draft.current_('round').should eq 2
		end

		it 'should return the current round of the draft when given the round parameter' do
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			team_two = FactoryGirl.create(:team_three)
			team_two = FactoryGirl.create(:team_four)
			team_two = FactoryGirl.create(:team_five)
			draft = FactoryGirl.create(:five_team_draft)
			draft.current_pick = 26
			draft.current_('round').should eq 6
		end

		it 'should return the current pick of the draft when given the pick parameter' do
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			team_two = FactoryGirl.create(:team_three)
			team_two = FactoryGirl.create(:team_four)
			team_two = FactoryGirl.create(:team_five)
			draft = FactoryGirl.create(:five_team_draft)
			draft.current_pick = 5
			draft.current_('pick').should eq 5
		end

		it 'should return the current pick of the draft when given the pick parameter' do
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			team_three = FactoryGirl.create(:team_three)
			team_four = FactoryGirl.create(:team_four)
			team_five = FactoryGirl.create(:team_five)
			draft = FactoryGirl.create(:five_team_draft)
			draft.current_pick = 9
			draft.current_('pick').should eq 4
		end
	end

	describe 'team_at' do
		it 'should return the team that has the pick passed as a parameter' do
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			team_three = FactoryGirl.create(:team_three)
			team_four = FactoryGirl.create(:team_four)
			team_five = FactoryGirl.create(:team_five)
			draft = FactoryGirl.create(:five_team_draft)
			draft.current_pick = 8
			draft.team_at(draft.current_pick).should eq draft.teams[2]
		end

		it 'should return the team that has the pick' do
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			team_three = FactoryGirl.create(:team_three)
			team_four = FactoryGirl.create(:team_four)
			team_five = FactoryGirl.create(:team_five)
			draft = FactoryGirl.create(:five_team_draft)
			draft.current_pick = 17
			draft.team_at(draft.current_pick).should eq draft.teams[3]
		end

		it 'should return the team that has the pick' do
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			team_three = FactoryGirl.create(:team_three)
			team_four = FactoryGirl.create(:team_four)
			team_five = FactoryGirl.create(:team_five)
			draft = FactoryGirl.create(:five_team_draft)
			draft.current_pick = 22
			draft.team_at(draft.current_pick).should eq draft.teams[1]
		end
	end

	describe 'drafted players' do
		it 'should return all players drafted' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			draft = FactoryGirl.create(:two_team_draft)
			pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
			draft.drafted_players.should eq [cam]
		end
	end

	describe 'available_players' do
		it 'should return all available_players' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			forte = FactoryGirl.create(:matt_forte)
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			draft = FactoryGirl.create(:two_team_draft)
			pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
			draft.available_players.should eq [reggie, forte]
		end

		it 'should not delete players from the database' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			forte = FactoryGirl.create(:matt_forte)
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			draft = FactoryGirl.create(:two_team_draft)
			pick = Pick.create(:player_id => cam.id, :team_id => draft.team_at(draft.current_pick).id, :draft_id => draft.id, :draft_position => draft.current_pick)
			draft.available_players
			Player.all.should eq [cam, reggie, forte]
		end
	end

	describe 'teams' do
		it 'should have a set number of teams' do
				team1 = FactoryGirl.create(:team)
				team2 = FactoryGirl.create(:team_two)
				draft = FactoryGirl.create(:two_team_draft)
				draft.number_of_teams.should eq 2
			end

		it 'should return an array of teams that are associated with the draft' do
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			draft = FactoryGirl.create(:two_team_draft)
			draft.teams.should eq [Team.all[2], Team.all[3]]
		end
	end

	describe 'set_order' do
		it 'should set the order of the draft' do
			team = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			team3 = FactoryGirl.create(:team_three)
			team4 = FactoryGirl.create(:team_four)
			team5 = FactoryGirl.create(:team_five)
			team6 = FactoryGirl.create(:team_six)
			team7 = FactoryGirl.create(:team_seven)
			team8 = FactoryGirl.create(:team_eight)
			team9 = FactoryGirl.create(:team_nine)
			team10 = FactoryGirl.create(:team_ten)
			team11 = FactoryGirl.create(:team_eleven)
			team12 = FactoryGirl.create(:team_twelve)
			draft = FactoryGirl.create(:draft)
			draft.set_order[23].should eq draft.teams[0]
		end
	end

	describe 'make_selection' do
		it 'should create a new pick when given a player' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			forte = FactoryGirl.create(:matt_forte)
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			draft = FactoryGirl.create(:two_team_draft)
			draft.make_selection(cam)
			draft.current_pick.should eq 2
		end

		it 'should add the player to the team that is currently drafting' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			forte = FactoryGirl.create(:matt_forte)
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			draft = FactoryGirl.create(:two_team_draft)
			draft.make_selection(cam)
			Pick.all[0].team_id.should eq draft.teams[0].id
		end

		it 'should add the player to the drafted array' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			forte = FactoryGirl.create(:matt_forte)
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			draft = FactoryGirl.create(:two_team_draft)
			draft.make_selection(cam)
			draft.drafted_players.should eq [cam]
		end

		it 'should remove the player from the available_players array' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			forte = FactoryGirl.create(:matt_forte)
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			draft = FactoryGirl.create(:two_team_draft)
			draft.make_selection(cam)
			draft.available_players.should eq [reggie, forte]
		end

		it 'should advance the current team in the order' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			forte = FactoryGirl.create(:matt_forte)
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			draft = FactoryGirl.create(:two_team_draft)
			draft.make_selection(cam)
			draft.team_at(draft.current_pick).should eq draft.teams[1]
		end
	end
end
