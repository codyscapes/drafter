class RemoveTierFromPlayers < ActiveRecord::Migration
  def change
	  remove_column(:players, :tier, :integer)
  end
end
