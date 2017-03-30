class InstrumentSetup < ActiveRecord::Base
  belongs_to :user
  has_many :setup_instruments
  has_many :instruments, through: :setup_instruments
  has_many :tags

  def self.search(content)
    if content == ""
      InstrumentSetup.all
    else
      tags = Tag.where("name LIKE ?", "%#{content}%")
      inst_sets = []

      tags.each do |t|
        inst_sets.push(t.instrument_setup)
      end

      inst_sets
    end
  end

end
