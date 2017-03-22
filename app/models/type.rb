class Type < ActiveRecord::Base
  has_many :instruments
  validates :name, length: {minimum: 2}

  def to_s
    name
  end
end
