class Manufacturer < ActiveRecord::Base
  has_many :instruments
  validates :name, length: {minimum: 2}
  validates :year, format: {with: /\d\d\d\d/}

  def to_s
    name
  end

  def self.search(content)
    if content == ""
      Manufacturer.all
    else
      Manufacturer.where("name LIKE ?", "%#{content}%")
    end
  end
end
