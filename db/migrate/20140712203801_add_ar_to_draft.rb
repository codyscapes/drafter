class AddArToDraft < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
    	t.integer :draft_position
    	t.integer :number_of_teams
    	t.integer :PPTD
    	t.integer :PPR
    	t.integer :Number_of_starting_QBs
    	t.integer :Number_of_starting_HBs
    	t.integer :Number_of_starting_WRs
    	t.integer :Number_of_starting_FLEX
    	t.string :draft_type
    	t.string :keeper
    	t.string :ranking_method
    	t.timestamps
    end
  end
end
