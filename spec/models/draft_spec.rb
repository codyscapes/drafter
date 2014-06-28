require 'rails_helper'

RSpec.describe Draft, :type => :model do

	describe 'initialize' do
		it 'should initialize with an array for player one' do
			draft = Draft.create(12, "snake")
			draft.teams.length.should eq 12
		end

		it 'should initialize with a default 16 rounds' do
			draft = Draft.create(12, "snake")
			draft.rounds.should eq 16
		end

		it 'should initialize with a draft type (snake or auction)' do
			draft = Draft.create(2, "snake")
			draft.type.should eq "snake"
		end

		it 'should initialize each team with a unique team name and number' do
			draft = Draft.create(2, "snake")
			draft.teams[1].team_name.should eq "Team 2"
		end

		it 'should initialize with a list of available players' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft = Draft.create(2, "snake")
			draft.players.should eq [cam, reggie]
		end
	end

	describe 'change_round_number' do
		it 'should let the user change the number of rounds in the draft' do
			draft = Draft.create(2, "snake")
			draft.change_round_number(15)
			draft.rounds.should eq 15
		end
	end

	describe 'start' do
		it 'creates the draft order if the draft type is snake' do
			draft = Draft.create(8, 'snake')
			draft.start()
			draft.team_picks(draft.teams[0]).should eq [0,15,16,31,32,47,48,63,64,79,80,95,96,111,112,127]
		end
	end

	describe 'team_picks' do
		it 'returns the picks of a given team' do
			draft = Draft.create(8, 'snake')
			draft.start()
			draft.team_picks(draft.teams[1]).should eq [1,14,17,30,33,46,49,62,65,78,81,94,97,110,113,126]
		end
	end

	describe 'pick' do
		it 'puts a player into a team array' do
			player = FactoryGirl.create(:player)
			draft = Draft.create(8, 'snake')
			draft.start()
			draft.pick(player)
			draft.teams[0].drafted_players[0].name.should eq 'Cam Newton'
		end

		it "automatically cycles to the next player's pick" do
			player = FactoryGirl.create(:player)
			draft = Draft.create(8, 'snake')
			draft.start()
			draft.pick(player)
			draft.order[0].should eq draft.teams[1]
		end

		it 'removes the player selected from the players array.' do
			player = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			draft = Draft.create(8, 'snake')
			draft.start()
			draft.pick(player)
			draft.players.should eq [reggie]
		end
	end

	describe 'best_available' do
		it 'should tell the drafting team the best best player available in the draft' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			jamaal = FactoryGirl.create(:jamaal_charles)
			draft = Draft.create(8, 'snake')
			draft.start()
			draft.best_available("beer_value").should eq jamaal
		end

		it 'should tell the drafting team the best player available in the draft and not show a player that has already been drafted.' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			forte = FactoryGirl.create(:matt_forte)
			jamaal = FactoryGirl.create(:jamaal_charles)
			draft = Draft.create(8, 'snake')
			draft.start()
			draft.pick(jamaal)
			draft.best_available("beer_value").should eq forte
		end
	end

	describe 'second_best_available' do
		it 'should return the second best player available in the draft' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			jamaal = FactoryGirl.create(:jamaal_charles)
			forte = FactoryGirl.create(:matt_forte)
			rice = FactoryGirl.create(:ray_rice)
			draft = Draft.create(8, 'snake')
			draft.start()
			draft.pick(jamaal)
			draft.second_best_available("beer_value").should eq reggie
		end
	end

	describe 'third_best_available' do
		it 'should return the third best player available in the draft' do
			cam = FactoryGirl.create(:player)
			reggie = FactoryGirl.create(:reggie_bush)
			jamaal = FactoryGirl.create(:jamaal_charles)
			forte = FactoryGirl.create(:matt_forte)
			rice = FactoryGirl.create(:ray_rice)
			draft = Draft.create(8, 'snake')
			draft.start()
			draft.pick(jamaal)
			draft.third_best_available("beer_value").should eq cam
		end
	end
end
