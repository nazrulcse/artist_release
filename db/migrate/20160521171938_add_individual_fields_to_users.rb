class AddIndividualFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :band, :string
    add_column :users, :what_play, :string
    add_column :users, :how_long_play, :string
    add_column :users, :role, :string
    add_column :users, :how_long_perform, :string
    add_column :users, :how_long_write, :string
    add_column :users, :age, :float
  end
end
