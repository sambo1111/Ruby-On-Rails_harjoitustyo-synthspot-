json.extract! review, :id, :topic, :body, :score, :user_id, :instrument_id, :created_at, :updated_at
json.url review_url(review, format: :json)
