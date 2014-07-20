class Pick < ActiveRecord::Base
	validates :draft_id, :presence => true
	validates :player_id, :presence => true
	validates :team_id, :presence => true
	validates :draft_position, :presence => true

	belongs_to :team
	belongs_to :player
	belongs_to :draft

	def self.available_players(draft_var)
		draft_var.update_available_players(draft_var)
	end


# Both of the tests below are being taken out because I cannot get the draft to work.
# The draft.id returns the same id as the draft being made in the test but the draft is not saving the @available_players instance variable after being created.
	# def available_players_returns_ni
	# 	print draft.id
	# 	draft.available_players
	# end

# This works but only because draft.start is being called - it shouldn't have to require draft.start because start is called before the draft object is saved to the DB.
	# def available_players_working
	# 	draft.start
	# 	draft.available_players
	# end

end
