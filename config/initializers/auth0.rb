# Rails.application.config.middleware.use OmniAuth::Builder do
#     provider(
#       :auth0,
#       Rails.application.credentials.auth0_client_id,
#       Rails.application.credentials.auth0_client_secret,
#       'shardest.eu.auth0.com',
#       callback_url: 'https://shardest.com/a/account/auth/oauth2/callback',
#       authorize_params: {
#         scope: 'openid profile'
#       }
#     )
#   end