class ShopApi

  def self.fetch_deals(keyword)

    #Rails.cache.fetch(keyword, expires_in: 2.minutes) {fetch(keyword)}
    fetch(keyword)

  end

  def self.fetch(keyword)
    formatted_keyword = ERB::Util.url_encode(keyword)
    url = "http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsAdvanced&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=#{apikey}&RESPONSE-DATA-FORMAT=XML&REST-PAYLOAD&keywords=#{formatted_keyword}&categoryId=38071"
    response = HTTParty.get "#{url}"

    parsed_response = response["findItemsAdvancedResponse"]["searchResult"]["item"]
    unless parsed_response.is_a?(Array)
      parsed_response = [parsed_response]
    end

    parsed_response
  end

  def self.apikey
    raise "APIKEY is not defined in environment variables" if ENV['EBAY_APIKEY'].nil?
    ENV['EBAY_APIKEY']
  end
end
