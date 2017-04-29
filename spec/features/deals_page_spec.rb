require 'rails_helper'

describe "deals page" do

  let!(:user) { FactoryGirl.create(:user, username:"eetvart", admin:false) }
  before :each do
    FactoryGirl.create(:instrument, name:"TB-303")
    visit signin_path
    fill_in('username', with:'eetvart')
    fill_in('password', with:'salainen')
    click_button('Log in')
  end

  it "renders the page correctly" do
    allow(ShopApi).to receive(:fetch_deals).with("TB-303").and_return(
    [{"itemId"=>"292083458650",
"title"=>
 "Cyclone Analogic TT303 TT-303 Bass Bot Bassbot V2 TB-303 NEW - PERFECT CIRCUIT",
"globalId"=>"EBAY-US",
"primaryCategory"=>{"categoryId"=>"38071", "categoryName"=>"Synthesizers"},
"galleryURL"=>
 "http://thumbs3.ebaystatic.com/m/mjwKVywZlfrlMDDgYIvnedw/140.jpg",
"viewItemURL"=>
 "http://www.ebay.com/itm/Cyclone-Analogic-TT303-TT-303-Bass-Bot-Bassbot-V2-TB-303-NEW-PERFECT-CIRCUIT-/292083458650",
"paymentMethod"=>"PayPal",
"autoPay"=>"true",
"postalCode"=>"91504",
"location"=>"Burbank,CA,USA",
"country"=>"US",
"shippingInfo"=>
 {"shippingServiceCost"=>{"__content__"=>"0.0", "currencyId"=>"USD"},
  "shippingType"=>"Free",
  "shipToLocations"=>["US", "CA", "AU", "Europe", "Asia"],
  "expeditedShipping"=>"false",
  "oneDayShippingAvailable"=>"false",
  "handlingTime"=>"1"},
"sellingStatus"=>
 {"currentPrice"=>{"__content__"=>"399.0", "currencyId"=>"USD"},
  "convertedCurrentPrice"=>{"__content__"=>"399.0", "currencyId"=>"USD"},
  "sellingState"=>"Active",
  "timeLeft"=>"P12DT3H21M47S"},
"listingInfo"=>
 {"bestOfferEnabled"=>"false",
  "buyItNowAvailable"=>"false",
  "startTime"=>"2017-04-12T01:58:14.000Z",
  "endTime"=>"2017-05-12T01:58:14.000Z",
  "listingType"=>"FixedPrice",
  "gift"=>"false"},
"returnsAccepted"=>"true",
"condition"=>{"conditionId"=>"1000", "conditionDisplayName"=>"New"},
"isMultiVariationListing"=>"false",
"topRatedListing"=>"false"}]
    )

    visit instruments_path
    click_link "TB-303"
    click_link "View Ebay deals"

    expect(page).to have_content("TT-303")

  end

end
