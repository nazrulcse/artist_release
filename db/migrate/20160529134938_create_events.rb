class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.string :location
      t.text :description
      t.string :image
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
