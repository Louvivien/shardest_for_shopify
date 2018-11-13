ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "0af1af4fb5dc153a59d7a44d2a1bbc69"
  config.secret = "2ee9a27406c2a213e86378a9f6a8e8ce"
  config.scope = "read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
