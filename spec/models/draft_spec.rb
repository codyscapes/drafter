require 'rails_helper'

RSpec.describe Draft, :type => :model do
	it 'should initialize with an array for player one' do
		draft = Draft.create(12, "snake")
		draft.teams.length.should eq 12
	end

	it 'should initialize with a draft type (snake or auction)' do
		draft = Draft.create(2, "snake")
		draft.type.should eq "snake"
	end

	it 'should initialize each team with a unique team name and number' do
		draft = Draft.create(2, "snake")
		draft.teams[1].team_name.should eq "Team 2"
	end

	# it 'should cycle through the teams in a draft.' do
	# 	draft = Draft.create(2)
	# 	draft.turn.should.eq draft.teams[0]
# end
end
