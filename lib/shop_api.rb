class ShopApi

  def self.fetch_deals(keyword)

    Rails.cache.fetch(keyword, expires_in: 5.minutes) {fetch(keyword)}

  end

  def self.fetch(keyword)
    formatted_keyword = ERB::Util.url_encode(keyword)
    url = "http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=#{apikey}&RESPONSE-DATA-FORMAT=XML&REST-PAYLOAD&keywords=#{formatted_keyword}"
    response = HTTParty.get "#{url}"

    parsed_response = response["findItemsByKeywordsResponse"]["searchResult"]["item"]
  end

  def self.apikey
    raise "APIKEY is not defined in environment variables" if ENV['EBAY_APIKEY'].nil?
    ENV['EBAY_APIKEY']
  end
end
