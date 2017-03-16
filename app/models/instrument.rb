class Instrument < ActiveRecord::Base
  has_many :user_instruments
  has_many :users, through: :user_instruments
  belongs_to :manufacturer
  belongs_to :type

  def to_s
    name
  end
end
