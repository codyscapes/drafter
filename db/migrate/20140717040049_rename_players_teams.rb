class RenamePlayersTeams < ActiveRecord::Migration
  def change
  	rename_table :players_teams, :picks
  end
end
