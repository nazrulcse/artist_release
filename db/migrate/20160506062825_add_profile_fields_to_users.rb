class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :category
    remove_column :users, :sub_category
    remove_column :users, :bio
    add_column :users, :category_id, :integer
    add_column :users, :sub_category_id, :integer
    add_column :users, :dob, :string
    add_column :users, :bio, :text
  end
end
