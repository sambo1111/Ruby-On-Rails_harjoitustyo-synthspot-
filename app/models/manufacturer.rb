class Manufacturer < ActiveRecord::Base
  has_many :instruments

  def to_s
    name
  end
end
