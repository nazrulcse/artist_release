class AddSlugFieldToEvents < ActiveRecord::Migration
  def change
    add_column :events, :slug, :string
    add_index :events, :slug, unique: true
  end
end
