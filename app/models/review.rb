class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :instrument

  validates :topic, length: {minimum: 1}
  validates :body, length: {minimum: 1}
  validates :score, :inclusion => 1..10

end
