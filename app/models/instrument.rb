class Instrument < ActiveRecord::Base
  has_many :user_instruments
  has_many :users, through: :user_instruments
  has_many :setup_instruments
  has_many :instrument_setups, through: :setup_instruments
  has_many :reviews

  belongs_to :manufacturer
  belongs_to :type
  validates :name, length: {minimum: 2}
  validates :type, presence: true

  def to_s
    name
  end

  def self.search(content)
    if content == ""
      Instrument.all
    else
      Instrument.where("name LIKE ?", "%#{content}%")
    end
  end

  def self.most_famous
    if SetupInstrument.first != nil
      Rails.cache.fetch("most_fam", expires_in: 10.minutes) {get_most_famous}
    end
  end

  def self.get_most_famous

    instruments = SetupInstrument.all
    instruments.order(instrument_id: :asc)

    id = nil
    count = 0
    highest_id = nil
    highest_count = 0

    instruments.each do |inst|

      if id == inst.instrument_id
        count = count + 1
      else
        if count > highest_count
          highest_count = count
          highest_id = id
        end
        id = inst.instrument_id
        count = 1
      end

    end

    if highest_id != nil
      Instrument.find_by(id:highest_id)
    end
  end
end
