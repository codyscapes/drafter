class RenameStatus < ActiveRecord::Migration
  def change
		remove_column(:players, :status, :string)
		add_column(:players, :drafted, :boolean)
  end
end
