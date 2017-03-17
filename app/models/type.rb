class Type < ActiveRecord::Base
  has_many :instruments
  validates :name, uniqueness: true, length: {minimum: 2}

  def to_s
    name
  end
end
