class Suggestion < ActiveRecord::Base
  belongs_to :user
  validates :topic, presence:true
end
