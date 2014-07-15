class AddMasterColumnToPlayers < ActiveRecord::Migration
  def change
  	add_column(:players, :master, :boolean)
  end
end
