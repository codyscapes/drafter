class AddToJoin < ActiveRecord::Migration
  def change
  	add_column :players_teams, :draft_id, :integer
  	add_column :players_teams, :draft_position, :integer
  end
end
