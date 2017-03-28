json.extract! message, :id, :topic, :body, :receiver_name, :receiver_id, :sender_id, :created_at, :updated_at
json.url message_url(message, format: :json)
