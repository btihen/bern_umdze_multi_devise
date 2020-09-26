class Patron < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :trackable, # :registerable,
          :rememberable, :validatable #, :recoverable
          # :authentication_keys => [:username, :email] # {email: false, username: true} #

  validates :email, uniqueness: true
  # validates :username, presence: true, uniqueness: true

  # # although emails is required on create - it won't be needed at other times
  # def email_required?
  #   false
  # end

  # def email_changed?
  #   false
  # end

  # # use this instead of email_changed? for Rails = 5.1.x
  # def will_save_change_to_email?
  #   false
  # end
end
