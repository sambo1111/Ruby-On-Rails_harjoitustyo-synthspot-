class Suggestion < ActiveRecord::Base
  belongs_to :user
  validates :topic, length: {minimum: 3}
  validates :info, length: {minimum: 3}
end
