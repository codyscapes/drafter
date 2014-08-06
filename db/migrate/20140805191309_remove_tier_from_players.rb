class RemoveTierFromPlayers < ActiveRecord::Migration
  def change
	  remove_column(:players, :tier, :integer)
	  remove_column(:players, :master, :boolean)
  end
end
