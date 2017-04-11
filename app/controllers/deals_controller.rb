class DealsController < ApplicationController

before_action :ensure_that_signed_in, only: [:index]

  def index
    @deals = ShopApi.fetch_deals(session[:keyword])
  end
end
