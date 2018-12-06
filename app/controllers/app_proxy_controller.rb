class AppProxyController < ApplicationController
   include ShopifyApp::AppProxyVerification

  def index
    @shop = Shop.find_by(shopify_domain: params[:shop])
    if @shop
      @shop.with_shopify_session do
      @products = ShopifyAPI::Product.find(:all)
      end
    end
  end

end
