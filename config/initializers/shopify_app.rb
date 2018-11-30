ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = Rails.application.credentials.api_key
  config.secret = Rails.application.credentials.secret
  config.scope = "read_products", "write_content", "read_content"
  # Consult this page for more scope options:
  # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
