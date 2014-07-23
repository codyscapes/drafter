class AddMasterToTeams < ActiveRecord::Migration
  def change
  	add_column(:teams, :master, :boolean, default: false)
  end
end
