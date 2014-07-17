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
end
