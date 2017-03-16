class User < ActiveRecord::Base
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  validates :username, uniqueness: true
  has_secure_password
end
