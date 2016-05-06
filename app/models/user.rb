class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :security_question
  belongs_to :category
  belongs_to :sub_category, class_name: 'Category', foreign_key: 'sub_category_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
