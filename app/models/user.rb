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
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  accepts_nested_attributes_for :profile_pictures, allow_destroy: true

  after_create :send_welcome_email if Rails.env.production?

  def profile_image
    if profile_pictures.present?
      profile_pictures.first.image.url(:large)
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

  def short_address
    if country.present? && estate.present?
      estate << ', ' << country
    elsif country.present?
      country
    elsif estate.present?
      estate
    end
  end

  def track
    if category.present? && sub_category.present?
      "#{sub_category.name}, #{category.name}"
    elsif category.present?
      category.name
    elsif sub_category.present?
      sub_category.name
    end
  end

  private

  def send_welcome_email
    UserMailer.send_welcome_email(self).deliver_now
  end

  def slug_candidates
    [
        [:first_name, :last_name],
        :first_name,
        :last_name
    ]
  end

end
