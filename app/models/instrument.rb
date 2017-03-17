class Instrument < ActiveRecord::Base
  has_many :user_instruments
  has_many :users, through: :user_instruments
  belongs_to :manufacturer
  belongs_to :type
  validates :name, uniqueness: true, length: {minimum: 2}
  validates :type, presence: true

  def to_s
    name
  end
end
