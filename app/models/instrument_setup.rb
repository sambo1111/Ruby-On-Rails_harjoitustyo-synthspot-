class InstrumentSetup < ActiveRecord::Base
  belongs_to :user
  has_many :setup_instruments
  has_many :instruments, through: :setup_instruments
  has_many :tags
end
