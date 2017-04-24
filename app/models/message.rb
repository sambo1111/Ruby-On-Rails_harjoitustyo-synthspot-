class Message < ActiveRecord::Base
  belongs_to :receiver, :foreign_key => :receiver_id, class_name:'User'
  belongs_to :sender, :foreign_key => :sender_id, class_name:'User'
  belongs_to :message_holder, :foreign_key => :message_holder_id, class_name:'User'

  validates :topic, length: {minimum: 1}
  validates :body, length: {minimum: 1}
  validates :receiver, presence: true

end
