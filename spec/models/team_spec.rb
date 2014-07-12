require 'rails_helper'

RSpec.describe Team, :type => :model do

	it { should have_many :players }

	# it 'should create a team with a team name equal to the team number' do
	# 	team = Team.create(2)
	# 	team.team_name.should eq "Team 2"
	# end

	# it 'should initialize with an empty array of players' do
	# 	team = Team.create(2)
	# 	team.drafted_players.should eq []
	# end

	# it 'should have the same draft number as the team number when initialized' do
	# 	team = Team.create(3)
	# 	team.draft_position.should eq 3
	# end

	# it 'should let the user change the draft position of a team' do
	# 	team = Team.create(2)
	# 	team.change_draft_position(2)
	# 	team.draft_position.should eq 2
	# end

	# it 'should let the user change the team name' do
	# 	team = Team.create(2)
	# 	team.change_team_name("Hungry Hippos")
	# 	team.team_name.should eq "Hungry Hippos"
	# end
end
