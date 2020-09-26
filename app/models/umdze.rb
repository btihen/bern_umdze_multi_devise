class Umdze < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :trackable, # :registerable,
          :rememberable, :validatable #, :recoverable

  validates :email,       presence: true, uniqueness: true
  validates :umdzes_name, presence: true
end
