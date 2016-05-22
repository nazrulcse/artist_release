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
  has_one :subscription
  belongs_to :sub_category, class_name: 'Category', foreign_key: 'sub_category_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  accepts_nested_attributes_for :profile_pictures, allow_destroy: true

  def profile_image
    if profile_pictures.present?
      profile_pictures.first.image_url(:large)
    else
      '/assets/profile_image.png'
    end
  end

  def full_name
    name = first_name.present? ? first_name : ''
    name << (last_name.present? ? ' ' << last_name : '')
  end

  # def update_without_password(params, *options)
  #
  #   if params[:password].blank?
  #     params.delete(:password)
  #     params.delete(:password_confirmation) if params[:password_confirmation].blank?
  #   end
  #
  #   result = update_attributes(params, *options)
  #   clean_up_passwords
  #   result
  # end

  # def update_with_password(params, *options)
  #   current_password = params[:current_password]
  #   params.delete(:current_password)
  #
  #   if params[:password].blank?
  #     params.delete(:password)
  #     params.delete(:password_confirmation) if params[:password_confirmation].blank?
  #   end
  #
  #   # result = if valid_password?(current_password)
  #   #            update_attributes(params, *options)
  #   #          else
  #   #            self.assign_attributes(params, *options)
  #   #            self.valid?
  #   #            self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
  #   #            false
  #   #          end
  #
  #   clean_up_passwords
  #   # result
  # end
end
