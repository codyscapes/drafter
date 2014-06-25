class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
    	t.string :name
    	t.string :team
    	t.integer :points_2013
    	t.integer :beer_value
    	t.integer :bye_week
    	t.integer :adp
    	t.integer :tier
    end
  end
end
