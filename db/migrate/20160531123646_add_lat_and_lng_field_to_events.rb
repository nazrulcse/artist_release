class AddLatAndLngFieldToEvents < ActiveRecord::Migration
  def change
    add_column :events, :lat, :float
    add_column :events, :lng, :float
    add_column :events, :country, :string
    add_column :events, :state, :string
  end
end
