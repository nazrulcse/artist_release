class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  MUSIC_BAND = {
      band: 'Band',
      invidual: 'Individual'
  }
  belongs_to :security_question
  belongs_to :category
  has_many :profile_pictures
  has_many :events
  has_one :subscription
  belongs_to :sub_category, class_name: 'Category', foreign_key: 'sub_category_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  accepts_nested_attributes_for :profile_pictures, allow_destroy: true

  #after_create :send_welcome_email

  def profile_image
    if profile_pictures.present?
      profile_pictures.first.image_url(:large)
    else
      'profile_image.png'
    end
  end

  def full_name
    if first_name.present? && last_name.present?
      first_name << ' ' << last_name
    elsif first_name.present?
      first_name
    else
      last_name
    end
  end

  private

  def send_welcome_email
    UserMailer.send_welcome_email(self).deliver
  end

end
