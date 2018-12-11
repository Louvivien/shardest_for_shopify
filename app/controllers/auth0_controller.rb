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

      

      rsa_private = OpenSSL::PKey::RSA.generate 2048
      rsa_public = rsa_private.public_key
      
      response = response.body

      response = JSON.parse(response).with_indifferent_access
      puts response
      token = response[:id_token]
      puts token


      decoded_token = JWT.decode token, rsa_public, false, { algorithm: 'RS256' }
      
      # Array
      # [
      #   {"data"=>"test"}, # payload
      #   {"alg"=>"RS256"} # header
      # ]
      puts decoded_token

    # This stores all the user information that came from Auth0
    # and the IdP
    puts session[:userinfo] = decoded_token[0]
    puts session[:userinfo]
    @user = session[:userinfo]
    # Redirect to the URL you want after successful auth
    #redirect_to '/a/account/dashboard',  shop: 'shop', path_prefix: 'path_prefix', timestamp: 'timestamp',  signature: 'signature'
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end



end
