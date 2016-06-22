class Category < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :users
  has_many :sub_categories, class_name: 'Category', foreign_key: 'category_id'
  has_many :sub_users, class_name: 'User', foreign_key: 'sub_category_id'

  def self.top_categories
    Category.where(category_id: [nil, ''])
  end

  def approved_profiles
    sub_users.where(is_approved: true)
  end
end
