class AddCountryCityEstateFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :estate, :string
    add_column :users, :address, :string
  end
end
