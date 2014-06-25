require 'rails_helper'

RSpec.describe Draft, :type => :model do
	it 'should initialize with an array for player one' do
		draft = Draft.create(12)
		draft.teams.length.should eq 12
	end

	it 'should initialize each team with a unique team name and number' do
		draft = Draft.create(2)
		draft.teams[1].team_name.should eq "Team 2"
	end
end
