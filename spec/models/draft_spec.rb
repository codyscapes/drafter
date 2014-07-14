require 'rails_helper'

RSpec.describe Draft, :type => :model do

	it { should have_many :teams }

	describe 'start' do
		it 'should have an array of players' do
			cam = FactoryGirl.create(:player)
			draft = FactoryGirl.create(:draft)
			draft.start
			draft.players.should eq [cam]
		end
	end

	describe 'number_of_teams' do
		it 'should return the number of teams' do
			draft = FactoryGirl.create(:draft)
			draft.number_of_teams.should eq 12
		end
	end

	describe 'set_teams' do
		it 'should initialize with a default number of teams taken from the teams template.' do
			draft = FactoryGirl.create(:draft)
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
				draft.start()
			draft.teams.first.team_name.should eq team.team_name
		end

		it 'should initialize with a default number of teams taken from the teams template and have the same drafting order as the template.' do
			draft = FactoryGirl.create(:draft)
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
				draft.start()
			draft.teams[11].draft_position.should eq team12.draft_position
		end
	end

	# describe 'teams' do
	# 	it 'should hold an array of all teams in the draft' do
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		team = Team.create(:team_name => 'team_one', :draft_position => 1, :draft_id => draft.id)
	# 		team2 = Team.create(:team_name => 'team_two', :draft_position => 2, :draft_id => draft.id)
	# 		team3 = Team.create(:team_name => 'team_three', :draft_position => 2, :draft_id => draft.id)
	# 		team4 = Team.create(:team_name => 'team_four', :draft_position => 2, :draft_id => draft.id)
	# 		team5 = Team.create(:team_name => 'team_five', :draft_position => 2, :draft_id => draft.id)
	# 		team6 = Team.create(:team_name => 'team_six', :draft_position => 2, :draft_id => draft.id)
	# 		team7 = Team.create(:team_name => 'team_seven', :draft_position => 2, :draft_id => draft.id)
	# 		team8 = Team.create(:team_name => 'team_eight', :draft_position => 2, :draft_id => draft.id)
	# 		draft.start()
	# 		draft.teams.should eq [team, team2, team3, team4, team5, team6, team7, team8]
	# 	end
	# end


	# describe 'order' do
	# 	it 'should tell the order of the draft with a team at each position in the array' do
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		team = Team.create(:team_name => 'team_one', :draft_position => 1, :draft_id => draft.id)
	# 		team2 = Team.create(:team_name => 'team_two', :draft_position => 2, :draft_id => draft.id)
	# 		team3 = Team.create(:team_name => 'team_three', :draft_position => 2, :draft_id => draft.id)
	# 		team4 = Team.create(:team_name => 'team_four', :draft_position => 2, :draft_id => draft.id)
	# 		team5 = Team.create(:team_name => 'team_five', :draft_position => 2, :draft_id => draft.id)
	# 		team6 = Team.create(:team_name => 'team_six', :draft_position => 2, :draft_id => draft.id)
	# 		team7 = Team.create(:team_name => 'team_seven', :draft_position => 2, :draft_id => draft.id)
	# 		team8 = Team.create(:team_name => 'team_eight', :draft_position => 2, :draft_id => draft.id)
	# 		draft.start()
	# 		draft.team_picks(draft.teams[0]).should eq [0,15,16,31,32,47,48,63,64,79,80,95,96,111,112,127]
	# 	end
	# end


	# describe 'order' do
	# 	it 'creates the draft order if the draft type is snake' do
	# 		draft = Draft.create(8, 'snake')
	# 		draft.start()
	# 		draft.team_picks(draft.teams[0]).should eq [0,15,16,31,32,47,48,63,64,79,80,95,96,111,112,127]
	# 	end
	# end

	# describe 'team_picks' do
	# 	it 'returns the picks of a given team' do
	# 		draft = Draft.create(8, 'snake')
	# 		draft.start()
	# 		draft.team_picks(draft.teams[1]).should eq [1,14,17,30,33,46,49,62,65,78,81,94,97,110,113,126]
	# 	end
	# end

	# describe 'pick' do
	# 	it 'puts a player into a team array' do
	# 		player = FactoryGirl.create(:player)
	# 		draft = Draft.create(8, 'snake')
	# 		draft.start()
	# 		draft.pick(player)
	# 		draft.teams[0].drafted_players[0].name.should eq 'Cam Newton'
	# 	end

	# 	it "automatically cycles to the next player's pick" do
	# 		player = FactoryGirl.create(:player)
	# 		draft = Draft.create(8, 'snake')
	# 		draft.start()
	# 		draft.pick(player)
	# 		draft.order[0].should eq draft.teams[1]
	# 	end

	# 	it 'removes the player selected from the players array.' do
	# 		player = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		draft = Draft.create(8, 'snake')
	# 		draft.start()
	# 		draft.pick(player)
	# 		draft.players.should eq [reggie]
	# 	end
	# end

	describe 'best_available' do
		it 'should return an array of the best players available in the draft' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			jamaal = FactoryGirl.create(:jamaal_charles)
			forte = FactoryGirl.create(:matt_forte)
			rice = FactoryGirl.create(:ray_rice)
			dud = FactoryGirl.create(:dud)
			draft = FactoryGirl.create(:draft)
			draft.start()
			draft.best_available.should eq [jamaal, forte, reggie]
		end

	# 	it 'should tell the drafting team the best player available in the draft and not show a player that has already been drafted.' do
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		forte = FactoryGirl.create(:matt_forte)
	# 		jamaal = FactoryGirl.create(:jamaal_charles)
	# 		draft = Draft.create(8, 'snake')
	# 		draft.start()
	# 		draft.pick(jamaal)
	# 		draft.best_available("beer_value")[0].should eq forte
	# 	end
	end

	# describe 'analyze_bye_week' do
	# 	it 'shouold analyze the drafting teams roster and if a suggested player has the same bye week as a player already in the roster, it should return the name of the player already in the roster.' do
	# 		dud = FactoryGirl.create(:dud)
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		jamaal = FactoryGirl.create(:jamaal_charles)
	# 		forte = FactoryGirl.create(:matt_forte)
	# 		rice = FactoryGirl.create(:ray_rice)
	# 		draft = Draft.create(2, 'snake')
	# 		draft.start()
	# 		draft.pick(jamaal)
	# 		draft.pick(cam)
	# 		draft.pick(reggie)
	# 		draft.analyze_bye_week(draft.best_available('beer_value')[0]).should eq jamaal
	# 	end

	# 	it 'should return false if a suggested player does not have the same bye week as a player in the same position for the team that is currently drafting.' do
	# 		dud = FactoryGirl.create(:dud)
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		jamaal = FactoryGirl.create(:jamaal_charles)
	# 		forte = FactoryGirl.create(:matt_forte)
	# 		rice = FactoryGirl.create(:ray_rice)
	# 		draft = Draft.create(2, 'snake')
	# 		draft.start()
	# 		draft.pick(cam)
	# 		draft.pick(jamaal)
	# 		draft.pick(forte)
	# 		draft.analyze_bye_week(draft.best_available('beer_value')[0]).should eq false
	# 	end
	# end

	# describe 'analyze_bye_weeks' do
	# 	it 'should analyze the bye week for each player in the suggested player array and return an array of responses corresponding to each player in the suggested player array.' do
	# 		dud = FactoryGirl.create(:dud)
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		jamaal = FactoryGirl.create(:jamaal_charles)
	# 		forte = FactoryGirl.create(:matt_forte)
	# 		rice = FactoryGirl.create(:ray_rice)
	# 		lacy = FactoryGirl.create(:eddie_lacy)
	# 		draft = Draft.create(2, 'snake')
	# 		draft.start()
	# 		draft.pick(jamaal)
	# 		draft.pick(cam)
	# 		draft.pick(rice)
	# 		draft.analyze_bye_weeks(draft.best_available('beer_value')).should eq [jamaal, false, jamaal]
	# 	end
	# end
end
