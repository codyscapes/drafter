require 'rails_helper'

RSpec.describe Draft, :type => :model do

	it { should have_many :teams }
	it { should have_many :picks }
	it { should have_many(:players).through(:picks)}

	describe 'rounds' do
		it 'should have a set number of rounds' do
			draft = FactoryGirl.create(:two_team_draft)
			draft.rounds.should eq 16
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
			team_two = FactoryGirl.create(:team_three)
			team_two = FactoryGirl.create(:team_four)
			team_two = FactoryGirl.create(:team_five)
			draft = FactoryGirl.create(:five_team_draft)
			draft.current_pick = 9
			draft.current_('pick').should eq 4
		end
	end


	# describe 'drafted players' do
	# 	it 'should return all players drafted' do
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		team_one = FactoryGirl.create(:team)
	# 		team_two = FactoryGirl.create(:team_two)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
	# 		draft.drafted_players.should eq []
	# 	end
	# end

	# describe 'available_players' do
	# 	it 'should return all available_players' do
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		forte = FactoryGirl.create(:matt_forte)
	# 		team_one = FactoryGirl.create(:team)
	# 		team_two = FactoryGirl.create(:team_two)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
	# 		draft.available_players.should eq [reggie, forte]
	# 	end

	# 	it 'should not delete players from the database' do
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		forte = FactoryGirl.create(:matt_forte)
	# 		team_one = FactoryGirl.create(:team)
	# 		team_two = FactoryGirl.create(:team_two)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
	# 		draft.available_players
	# 		Player.all.should eq [cam, reggie, forte]
	# 	end
	# end

	describe 'set_teams' do
		it 'should create teams in the database after initializing' do
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			draft = FactoryGirl.create(:two_team_draft)
			Team.all.count.should eq 4
		end
	end

	describe 'teams' do
		it 'should return an array of teams that are associated with the draft' do
			team_one = FactoryGirl.create(:team)
			team_two = FactoryGirl.create(:team_two)
			draft = FactoryGirl.create(:two_team_draft)
			draft.teams.should eq [Team.all[2], Team.all[3]]
		end
	end



	# it 'should have a set number of teams' do
	# 		team1 = FactoryGirl.create(:team)
	# 		team2 = FactoryGirl.create(:team_two)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		draft.number_of_teams.should eq 2
	# 	end


	# describe 'start' do
	# 	it 'should have an array of all available players' do
	# 		cam = FactoryGirl.create(:player)
	# 		draft = FactoryGirl.create(:draft)
	# 		draft.available_players.should eq [cam]
	# 	end

	# 	it 'should have current pick set to 1' do
	# 		draft = FactoryGirl.create(:draft)
	# 		draft.current_pick.should eq 1
	# 	end

	# 	it 'should set the order of the draft using set order' do
	# 		team1 = FactoryGirl.create(:team)
	# 		team2 = FactoryGirl.create(:team_two)
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		draft.order[2].should eq draft.teams[1]
	# 	end

	# 	it 'should define an array of drafted players' do
	# 		draft = FactoryGirl.create(:draft)
	# 		draft.drafted_players.should eq []
	# 	end
	# end

	# describe 'set_teams' do
	# 	it 'should initialize with a default number of teams taken from the teams template.' do
	# 		team = FactoryGirl.create(:team)
	# 		team2 = FactoryGirl.create(:team_two)
	# 		team3 = FactoryGirl.create(:team_three)
	# 		team4 = FactoryGirl.create(:team_four)
	# 		team5 = FactoryGirl.create(:team_five)
	# 		team6 = FactoryGirl.create(:team_six)
	# 		team7 = FactoryGirl.create(:team_seven)
	# 		team8 = FactoryGirl.create(:team_eight)
	# 		team9 = FactoryGirl.create(:team_nine)
	# 		team10 = FactoryGirl.create(:team_ten)
	# 		team11 = FactoryGirl.create(:team_eleven)
	# 		team12 = FactoryGirl.create(:team_twelve)
	# 		draft = FactoryGirl.create(:draft)
	# 		draft.teams[6].team_name.should eq team7.team_name
	# 	end

	# 	it 'should initialize with a default number of teams taken from the teams template and have the same drafting order as the template.' do
	# 		team = FactoryGirl.create(:team)
	# 		team2 = FactoryGirl.create(:team_two)
	# 		team3 = FactoryGirl.create(:team_three)
	# 		team4 = FactoryGirl.create(:team_four)
	# 		team5 = FactoryGirl.create(:team_five)
	# 		team6 = FactoryGirl.create(:team_six)
	# 		team7 = FactoryGirl.create(:team_seven)
	# 		team8 = FactoryGirl.create(:team_eight)
	# 		team9 = FactoryGirl.create(:team_nine)
	# 		team10 = FactoryGirl.create(:team_ten)
	# 		team11 = FactoryGirl.create(:team_eleven)
	# 		team12 = FactoryGirl.create(:team_twelve)
	# 		draft = FactoryGirl.create(:draft)
	# 		draft.teams[11].draft_position.should eq team12.draft_position
	# 	end
	# end

	# describe 'set_order' do
	# 	it 'should set the order of the draft' do
	# 		team = FactoryGirl.create(:team)
	# 		team2 = FactoryGirl.create(:team_two)
	# 		team3 = FactoryGirl.create(:team_three)
	# 		team4 = FactoryGirl.create(:team_four)
	# 		team5 = FactoryGirl.create(:team_five)
	# 		team6 = FactoryGirl.create(:team_six)
	# 		team7 = FactoryGirl.create(:team_seven)
	# 		team8 = FactoryGirl.create(:team_eight)
	# 		team9 = FactoryGirl.create(:team_nine)
	# 		team10 = FactoryGirl.create(:team_ten)
	# 		team11 = FactoryGirl.create(:team_eleven)
	# 		team12 = FactoryGirl.create(:team_twelve)
	# 		draft = FactoryGirl.create(:draft)
	# 		draft.order[23].should eq draft.teams[0]
	# 	end
	# end

	# describe 'order' do
	# 	it 'should return the order of the draft in an array' do
	# 		team = FactoryGirl.create(:team)
	# 		team2 = FactoryGirl.create(:team_two)
	# 		team3 = FactoryGirl.create(:team_three)
	# 		team4 = FactoryGirl.create(:team_four)
	# 		team5 = FactoryGirl.create(:team_five)
	# 		team6 = FactoryGirl.create(:team_six)
	# 		team7 = FactoryGirl.create(:team_seven)
	# 		team8 = FactoryGirl.create(:team_eight)
	# 		team9 = FactoryGirl.create(:team_nine)
	# 		team10 = FactoryGirl.create(:team_ten)
	# 		team11 = FactoryGirl.create(:team_eleven)
	# 		team12 = FactoryGirl.create(:team_twelve)
	# 		draft = FactoryGirl.create(:draft)
	# 		draft.order[23].should eq draft.teams[0]
	# 	end
	# end
end
