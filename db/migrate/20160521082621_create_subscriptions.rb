class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :plan
      t.string :stripe_id
      t.float :amount
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
