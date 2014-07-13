class AddingToDraft < ActiveRecord::Migration
  def change
    create_table :teams do |t|
			t.string :team_name
			t.integer :draft_position
			t.integer :draft_id
    end
			add_column(:players, :team_id, :integer)
  end
end
