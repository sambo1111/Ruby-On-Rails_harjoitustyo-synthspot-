class SetupInstrument < ActiveRecord::Base
  belongs_to :instrument_setup
  belongs_to :instrument
end
