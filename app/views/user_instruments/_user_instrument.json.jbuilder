json.extract! user_instrument, :id, :user_id, :instrument_id, :created_at, :updated_at
json.url user_instrument_url(user_instrument, format: :json)
