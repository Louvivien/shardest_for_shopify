class AppProxyController < ApplicationController
   include ShopifyApp::AppProxyVerification

  def index
    render layout: false
    @customers = ShopifyAPI::Customer.find(:all, params: { limit: 10 })
  end

end
