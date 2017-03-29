class EventApi

  def self.fetch_venues(city)
    url = "https://api.seatgeek.com/2/venues?city=#{ERB::Util.url_encode(city)}&client_id=#{apikey}"
    response = HTTParty.get "#{url}"
  end

  def self.apikey
    #raise "APIKEY is not defined in environment variables" if ENV['EVENT_APIKEY'].nil?
    #ENV['EVENT_APIKEY']
    "NzE3NzUwOXwxNDkwNzM5NzI4LjQ0"
  end
end
