class CreateProfilePictures < ActiveRecord::Migration
  def change
    create_table :profile_pictures do |t|
      t.integer :user_id
      t.string :image

      t.timestamps null: false
    end
  end
end
