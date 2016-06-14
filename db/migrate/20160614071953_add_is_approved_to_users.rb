class AddIsApprovedToUsers < ActiveRecord::Migration
  def up
    add_column :users, :is_approved, :boolean, :default => false
  end
  def down
    remove_column :users, :is_approved
  end
end
