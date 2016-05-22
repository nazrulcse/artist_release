class Contact < ActiveRecord::Base
  validates :first_name,:last_name,:email,:phone,:message, presence: true
end
