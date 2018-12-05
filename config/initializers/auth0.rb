Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    Rails.application.credentials.auth0_client_id,
    Rails.application.credentials.auth0_client_secret,
    Rails.application.credentials.auth0_domain,
    callback_path: '/auth/oauth2/callback',
    authorize_params: {
      scope: 'openid profile'
    }
  )
end