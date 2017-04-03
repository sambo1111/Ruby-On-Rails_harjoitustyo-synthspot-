class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :instrument_setup

  validates :user, presence: true
  validates :instrument_setup, presence: true
end
