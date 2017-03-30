class User < ActiveRecord::Base
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :instrument_setups
  has_many :suggestions
  validates :username, uniqueness: true, length: {minimum: 3}
  has_many :messages
  has_many :reviews
  has_secure_password

  def self.search(content)
    if content == ""
      User.all
    else
      User.where("username LIKE ?", "%#{content}%")
    end
  end
end
