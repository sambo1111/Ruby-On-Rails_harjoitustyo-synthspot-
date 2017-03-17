class User < ActiveRecord::Base
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  validates :username, uniqueness: true, length: {minimum: 3}
  has_secure_password
end
