class ChangePlayers < ActiveRecord::Migration
  def change
		remove_column(:players, :beer_value, :integer)
		add_column(:players, :beer_value, :float)
  end
end
