class ShopApi

  def self.fetch_stores(city)
    url
    response = HTTParty.get "#{url}"
  end

  def self.apikey
    #raise "APIKEY is not defined in environment variables" if ENV['EVENT_APIKEY'].nil?
    #ENV['EVENT_APIKEY']
    "e642879ec365b73d0dc833d3fcefbfb4"
  end
end
