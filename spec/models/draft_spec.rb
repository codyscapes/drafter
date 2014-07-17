require 'rails_helper'

RSpec.describe Draft, :type => :model do

	it { should have_many :teams }
	it { should have_many :picks }
	it { should have_many(:players).through(:picks)}



	describe 'start' do
		it 'should have an array of all available players' do
			draft = FactoryGirl.create(:draft)
			cam = FactoryGirl.create(:player)
			draft.start
			draft.available_players.should eq [cam]
		end

		it 'should have current pick set to 1' do
			draft = FactoryGirl.create(:draft)
			draft.start
			draft.current_pick.should eq 1
		end

		it 'should set the order of the draft using set order' do
			draft = FactoryGirl.create(:two_team_draft)
			team1 = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team_two)
			draft.start
			draft.order[2].should eq draft.teams[1]
		end

		it 'should define an array of drafted players' do
			draft = FactoryGirl.create(:draft)
			draft.start
			draft.drafted_players.should eq []
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
			draft.teams[6].team_name.should eq team7.team_name
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

		describe 'set_order' do
			it 'should set the order of the draft' do
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
				draft.order[23].should eq draft.teams[0]
			end
		end

		describe 'order' do
			it 'should return the order of the draft in an array' do
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
				draft.order[23].should eq draft.teams[0]
			end
		end



	# describe 'available_players' do
	# 	it 'should return all players who have not been drafted in the draft' do
	# 		draft = FactoryGirl.create(:two_team_draft)
	# 		team = FactoryGirl.create(:team)
	# 		team2 = FactoryGirl.create(:team_two)
	# 		cam = FactoryGirl.create(:player)
	# 		reggie = FactoryGirl.create(:reggie_bush)
	# 		draft.start()
	# 		pick = Pick.create(:player_id => cam.id, :team_id => draft.order[0].id, :draft_id => draft.id, :draft_position => draft.current_pick)
	# 		draft.available_players.should eq [reggie]
	# 	end
	# end




# 	describe 'best_available' do
# 		it 'should return an array of the best players available in the draft' do
# 			cam = FactoryGirl.create(:player)
# 			reggie = FactoryGirl.create(:reggie_bush)
# 			jamaal = FactoryGirl.create(:jamaal_charles)
# 			forte = FactoryGirl.create(:matt_forte)
# 			rice = FactoryGirl.create(:ray_rice)
# 			dud = FactoryGirl.create(:dud)
# 			draft = FactoryGirl.create(:draft)
# 			draft.start()
# 			draft.best_available.should eq [jamaal, forte, reggie]
# 		end

# 		# it 'should return an array of the best players STILL available in the draft' do
# 		# 	jamaal = FactoryGirl.create(:jamaal_charles)
# 		# 	cam = FactoryGirl.create(:player)
# 		# 	reggie = FactoryGirl.create(:reggie_bush)
# 		# 	forte = FactoryGirl.create(:matt_forte)
# 		# 	rice = FactoryGirl.create(:ray_rice)
# 		# 	dud = FactoryGirl.create(:dud)
# 		# 	draft = FactoryGirl.create(:two_team_draft)
# 		# 	team = FactoryGirl.create(:team)
# 		# 	team2 = FactoryGirl.create(:team_two)
# 		# 	draft.start()
# 		# 	draft.pick(draft.players[0])
# 		# 	draft.best_available.should eq [forte, reggie, cam]
# 		# end
# 	end

# 	describe 'number_of_teams' do
# 		it 'should return the number of teams' do
# 			draft = FactoryGirl.create(:draft)
# 			draft.number_of_teams.should eq 12
# 		end
	# end
end
