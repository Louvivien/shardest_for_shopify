ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = Rails.application.credentials.dig(:shopify, :api_key) 
  config.secret = Rails.application.credentials.dig(:shopify, :secret) 
  config.scope = "read_products, write_products, write_content, read_content, read_product_listings, read_customers, write_customers, read_orders, write_orders, read_all_orders, read_draft_orders, write_draft_orders, read_inventory, write_inventory, read_locations, read_script_tags, write_script_tags, read_fulfillments, write_fulfillments, read_shipping, write_shipping, read_analytics, read_checkouts, write_checkouts, read_reports, write_reports, read_price_rules, write_price_rules, read_marketing_events, write_marketing_events, read_resource_feedbacks, write_resource_feedbacks, read_shopify_payments_payouts"
  # Consult this page for more scope options:
  # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
