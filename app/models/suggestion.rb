class Suggestion < ActiveRecord::Base
  belongs_to :user
  validates :topic, length: {minimum: 5}
  validates :info, length: {minimum: 10}
end
