Rails.application.config.middleware.use OmniAuth::Builder do
    provider(
      :auth0,
    )
  end