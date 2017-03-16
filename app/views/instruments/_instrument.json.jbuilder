json.extract! instrument, :id, :name, :year, :info, :manufacturer_id, :created_at, :updated_at
json.url instrument_url(instrument, format: :json)
