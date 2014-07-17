class RemoveDraftedFromPlayers < ActiveRecord::Migration
  def change
  	remove_column(:players, :drafted, :boolean)
  end
end
