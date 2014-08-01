require 'rails_helper'

RSpec.describe Draft, :type => :model do

	# it { should have_many :teams }
	# it { should have_many :picks }
	# it { should have_many(:players).through(:picks)}

 #  it { should validate_presence_of :draft_position}
 #  it { should validate_presence_of :number_of_teams}
 #  it { should validate_presence_of :PPTD}
 #  it { should validate_presence_of :PPR}
 #  it { should validate_presence_of :Number_of_starting_QBs}
 #  it { should validate_presence_of :Number_of_starting_HBs}
 #  it { should validate_presence_of :Number_of_starting_WRs}
 #  it { should validate_presence_of :Number_of_starting_FLEX}
 #  it { should validate_presence_of :draft_type}
 #  it { should validate_presence_of :keeper}
 #  it { should validate_presence_of :ranking_method}
 #  it { should validate_presence_of :rounds}
 #  it { should validate_presence_of :current_pick}

	describe 'two_team_testing' do
		before :each do
			@cam = FactoryGirl.create(:player)
			@reggie = FactoryGirl.create(:reggie_bush)
			@peyton = FactoryGirl.create(:peyton_manning)
			@team_one = FactoryGirl.create(:team)
			@team_two = FactoryGirl.create(:team_two)
			@draft = FactoryGirl.create(:two_team_draft)
		end

		# describe 'teams' do
		# 	it 'should return an array with two teams' do
		# 		@draft.reload.teams.length.should eq 2
		# 	end
		# end


		# describe 'rounds' do
		# 	it 'should have a set number of rounds' do
		# 		@draft.rounds.should eq 16
		# 	end
		# end

		# describe 'user_turn' do
		# 	context 'true' do
		# 		it "should return true if it is the user's turn" do
		# 			@draft.user_turn.should eq true
		# 		end
		# 	end

		# 	context 'false' do
		# 		it "should return false if it is not the user's turn" do
		# 			pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
		# 			@draft.reload.user_turn.should eq false
		# 		end
		# 	end
		# end

		# describe 'set_teams' do
		# 	it 'should create teams in the database after initializing' do
		# 		Team.all.count.should eq 4
		# 	end
		# end

		# describe 'teams' do
		# 	it 'should have a set number of teams' do
		# 		@draft.number_of_teams.should eq 2
		# 	end

		# 	it 'should return an array of teams that are associated with the draft' do
		# 		@draft.teams.should eq [Team.all[2], Team.all[3]]
		# 	end
		# end

		# describe 'current_pick' do
		# 	it 'should have a current_pick' do
		# 		@draft.current_pick.should eq 1
		# 	end
		# end

		# describe 'updraft' do
		# 	it 'should increase current_pick by 1' do
		# 		@draft.updraft
		# 		@draft.current_pick.should eq 2
		# 	end
		# end

		describe 'current_pick' do
			it 'should return the current_pick' do
				pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
				@draft.reload.current_pick.should eq 2
			end

			it 'should return the current_pick of 3 after two players have been drafted' do
				pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
				pick1 = Pick.create(:player_id => @reggie.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
				@draft.reload.current_pick.should eq 3
			end
		end

		describe 'set_order' do
			context "3rd pick" do
				it 'in a two team draft, the third pick should initialize with a current pick of 3' do
					pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
					pick2 = Pick.create(:player_id => @reggie.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.reload.current_pick)
					@draft.reload.current_pick.should eq 3
				end
			end

			context '3rd pick' do
				it 'in a two team draft, with draft.current_pick set to three, the self.teams method should only return two teams' do
					pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
					pick2 = Pick.create(:player_id => @reggie.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.reload.current_pick)
					@draft.reload.teams.length.should eq 2
				end
			end

			context '3rd pick' do
				it 'in a two team draft, with draft.current_pick set to three, the set_order function should return team_two' do
					pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
					pick2 = Pick.create(:player_id => @reggie.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.reload.current_pick)
					@draft.reload.set_order[2].should eq @draft.reload.teams[1]
				end
			end
		end


		# describe 'team_at' do
		# 	context 'in a 2 team draft, the 1st pick belongs to team_one' do
		# 		it 'should return team_one when asked for the first pick in the draft' do
		# 			@draft.reload.team_at(@draft.reload.current_pick).team_name.should eq 'team_one'
		# 		end
		# 	end

		# 	context 'in a 2 team draft, after the 1st pick has been made, the second pick belongs to team_two' do
		# 		it 'should return team_two when asked for second pick in the draft' do
		# 			pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
		# 			@draft.reload.team_at(@draft.reload.current_pick).team_name.should eq 'team_two'
		# 		end
		# 	end

		# 	context 'in a 2 team draft, after the first 2 picks have been made, the third pick belongs to team_three' do
		# 		it 'should return team_two when asked for the third pick in the 2 team draft' do
		# 			pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
		# 			pick2 = Pick.create(:player_id => @reggie.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.reload.current_pick)
		# 			@draft.reload.team_at(@draft.reload.current_pick).team_name.should eq 'team_two'
		# 		end
		# 	end
		# end
			# it "should add the second pick to the seond team's roster" do
			# 	pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
			# 	pick2 = Pick.create(:player_id => @reggie.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.reload.current_pick)
			# 	@draft.reload.teams[1].roster.should eq [@reggie]
			# end

			# it "should add the third pick to the second team's roster in a two team draft" do
			# 	pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
			# 	pick2 = Pick.create(:player_id => @reggie.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.reload.current_pick)
			# 	pick3 = Pick.create(:player_id => @peyton.id, :team_id => @draft.reload.team_at(@draft.reload.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.reload.current_pick)
			# 	@draft.reload.teams[1].roster.should eq [@reggie, @peyton]
			# end
		# end
	end

	# describe 'five_team_testing' do
	# 	before :each do
	# 		@team_one = FactoryGirl.create(:team)
	# 		@team_two = FactoryGirl.create(:team_two)
	# 		@team_three = FactoryGirl.create(:team_three)
	# 		@team_four = FactoryGirl.create(:team_four)
	# 		@team_five = FactoryGirl.create(:team_five)
	# 		@draft = FactoryGirl.create(:five_team_draft)
	# 	end

	# 		describe 'current_' do
	# 			it 'should return the current round of the draft when given the round parameter' do
	# 				@draft.current_pick = 5
	# 				@draft.current_('round').should eq 1
	# 			end

	# 			it 'should return the current round of the draft when given the round parameter' do
	# 				@draft.current_pick = 7
	# 				@draft.current_('round').should eq 2
	# 			end

	# 			it 'should return the current round of the draft when given the round parameter' do
	# 				@draft.current_pick = 26
	# 				@draft.current_('round').should eq 6
	# 			end

	# 			it 'should return the current pick of the draft when given the pick parameter' do
	# 				@draft.current_pick = 5
	# 				@draft.current_('pick').should eq 5
	# 			end

	# 			it 'should return the current pick of the draft when given the pick parameter' do
	# 				@draft.current_pick = 9
	# 				@draft.current_('pick').should eq 4
	# 			end

	# 		describe 'team_at' do
	# 			it 'should return the team that has the pick passed as a parameter' do
	# 				@draft.current_pick = 8
	# 				@draft.team_at(@draft.current_pick).should eq @draft.teams[2]
	# 			end

	# 			it 'should return the team that has the pick' do
	# 				@draft.current_pick = 17
	# 				@draft.team_at(@draft.current_pick).should eq @draft.teams[3]
	# 			end

	# 			it 'should return the team that has the 22nd pick' do
	# 				@draft.current_pick = 22
	# 				@draft.team_at(@draft.current_pick).should eq @draft.teams[1]
	# 			end
	# 		end
	# 	end
	# end

	# describe 'player_testing' do
	# 	before :each do
	# 		@cam = FactoryGirl.create(:player)
	# 		@jamaal = FactoryGirl.create(:jamaal_charles)
	# 		@peyton = FactoryGirl.create(:peyton_manning)
	# 		@reggie = FactoryGirl.create(:reggie_bush)
	# 		@forte = FactoryGirl.create(:matt_forte)
	# 		@team_one = FactoryGirl.create(:team)
	# 		@team_two = FactoryGirl.create(:team_two)
	# 		@draft = FactoryGirl.create(:two_team_draft)
	# 	end

	# 	describe 'drafted players' do
	# 		it 'should return all players drafted' do
	# 			pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
	# 			@draft.drafted_players.should eq [@cam]
	# 		end
	# 	end

	# 	describe 'available_players' do
	# 		it 'should return all available_players' do
	# 			pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
	# 			@draft.available_players.should eq [@jamaal, @peyton, @reggie, @forte]
	# 		end

	# 		it 'should not delete players from the database' do
	# 			pick = Pick.create(:player_id => @cam.id, :team_id => @draft.team_at(@draft.current_pick).id, :draft_id => @draft.id, :draft_position => @draft.current_pick)
	# 			@draft.available_players
	# 			Player.all.should eq [@cam, @jamaal, @peyton, @reggie, @forte]
	# 		end
	# 	end

	# 	describe 'best_available' do
	# 		it 'should return an array of best available players for the current team' do
	# 			@draft.best_available.should eq [@jamaal, @forte, @reggie]
	# 		end
	# 	end
	# end

	# describe 'twelve_team_testing' do
	# 	before :each do
	# 		@cam = FactoryGirl.create(:player)
	# 		@jamaal = FactoryGirl.create(:jamaal_charles)
	# 		@forte = FactoryGirl.create(:matt_forte)
	# 		@peyton = FactoryGirl.create(:peyton_manning)
	# 		@team = FactoryGirl.create(:team)
	# 		@team2 = FactoryGirl.create(:team_two)
	# 		@team3 = FactoryGirl.create(:team_three)
	# 		@team4 = FactoryGirl.create(:team_four)
	# 		@team5 = FactoryGirl.create(:team_five)
	# 		@team6 = FactoryGirl.create(:team_six)
	# 		@team7 = FactoryGirl.create(:team_seven)
	# 		@team8 = FactoryGirl.create(:team_eight)
	# 		@team9 = FactoryGirl.create(:team_nine)
	# 		@team10 = FactoryGirl.create(:team_ten)
	# 		@team11 = FactoryGirl.create(:team_eleven)
	# 		@team12 = FactoryGirl.create(:team_twelve)
	# 		@draft = FactoryGirl.create(:draft)
	# 	end

	# 	describe 'set_order' do
	# 		context '1st pick' do
	# 			it 'in a 12 team draft, the 1st pick belongs to team_one' do
	# 				@draft.set_order[0].should eq @draft.teams[0]
	# 			end
	# 		end
	# 		context '2nd pick' do
	# 			it 'in a 12 team draft, the 2nd pick belongs to team_two' do
	# 				@draft.set_order[1].should eq @draft.teams[1]
	# 			end
	# 		end
	# 		context '3rd pick' do
	# 			it 'in a 12 team draft, the 3rd pick belongs to team_three' do
	# 				@draft.set_order[2].should eq @draft.teams[2]
	# 			end
	# 		end
	# 		context '7th pick' do
	# 			it 'in a 12 team draft, the 7th pick belongs to team_seven' do
	# 				@draft.set_order[6].should eq @draft.teams[6]
	# 			end
	# 		end
	# 		context '24th pick' do
	# 			it 'in a 12 team draft, the 24th pick belongs to team_one' do
	# 				@draft.set_order[23].should eq @draft.teams[0]
	# 			end
	# 		end
	# 		context '30th pick' do
	# 			it 'in a 12 team draft, the 30th pick belongs to team_seven' do
	# 				@draft.set_order[6].should eq @draft.teams[6]
	# 			end
	# 		end
	# 	end
	# 	describe 'advance_draft' do
	# 		it 'should advance a draft by automatically selecting the next best player' do
	# 			@draft.advance_draft
	# 			@draft.reload.drafted_players.should eq [@jamaal]
	# 		end
	# 	end
	# end
end
