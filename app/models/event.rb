class Event < ActiveRecord::Base
  mount_uploader :image, EventUploader
  belongs_to :user
  validates_presence_of :title, :location, :date
  extend FriendlyId
  friendly_id :title, use: :slugged

  def short_address
    if country.present? && state.present?
      country << ', ' << state
    elsif country.present?
      country
    elsif state.present?
      state
    else
      long_address
    end
  end

  def long_address
    location
  end
end
