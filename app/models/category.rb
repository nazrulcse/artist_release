class Category < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :users
  has_many :sub_categories, class_name: 'Category', foreign_key: 'category_id'

  def self.top_categories
    Category.where(category_id: [nil, ''])
  end
end
