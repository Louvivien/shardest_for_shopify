class HomeController < ShopifyApp::AuthenticatedController
  include ShopifyApp::AppProxyVerification
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
  end
end
