class AddToDraft < ActiveRecord::Migration
  def change
  	add_column(:drafts, :rounds, :integer, :default => 16)
  	add_column(:drafts, :current_pick, :integer, :default => 1)
  end
end
