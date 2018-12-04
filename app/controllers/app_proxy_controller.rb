class AppProxyController < ApplicationController
   include ShopifyApp::AppProxyVerification

  def index
    render layout: false
    @shop = Shop.find_by(shopify_domain: params[:shop])
    if @shop
      @shop.with_shopify_session do
        puts @products = ShopifyAPI::Product.find(:all)
        # la-dee-da I got a product...
      end
    end
  end

end
