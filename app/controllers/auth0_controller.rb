class Auth0Controller < ApplicationController
  include ShopifyApp::AppProxyVerification
  def callback
    
    require 'uri'
    require 'net/http'
    require 'jwt'
    
      url = URI("https://shardest.eu.auth0.com/oauth/token")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(url)
      request["content-type"] = 'application/json'
      request.body = "{\"grant_type\":\"authorization_code\",\"client_id\": \"ap1RB7pH8lSi-hdvq3W_tD-7IwIK7yov\",\"client_secret\": \"#{Rails.application.credentials.auth0_client_secret}\",\"code\": \"#{params[:code]}\",\"redirect_uri\": \"https://shardest.com/a/account/auth/oauth2/callback\"}"

      response = http.request(request)
      puts response.read_body

      

      payload = response[:id_token].read_body

      # IMPORTANT: set nil as password parameter
      token = JWT.encode payload, nil, 'none'

      # eyJhbGciOiJub25lIn0.eyJkYXRhIjoidGVzdCJ9.
      puts token

      # Set password to nil and validation to false otherwise this won't work
      decoded_token = JWT.decode payload, nil, false

      # Array
      # [
      #   {"data"=>"test"}, # payload
      #   {"alg"=>"none"} # header
      # ]
      puts decoded_token

    # This stores all the user information that came from Auth0
    # and the IdP
    # session[:userinfo] = request.env['omniauth.auth']
    # # Redirect to the URL you want after successful auth
    # redirect_to '/a/account/dashboard',  shop: 'shop', path_prefix: 'path_prefix', timestamp: 'timestamp',  signature: 'signature'
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end



end
