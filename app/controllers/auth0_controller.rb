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
      
      payload = response

      token = JWT.encode payload, rsa_private, 'RS256'
      
      # eyJhbGciOiJSUzI1NiJ9.eyJkYXRhIjoidGVzdCJ9.GplO4w1spRgvEJQ3-FOtZr-uC8L45Jt7SN0J4woBnEXG_OZBSNcZjAJWpjadVYEe2ev3oUBFDYM1N_-0BTVeFGGYvMewu8E6aMjSZvOpf1cZBew-Vt4poSq7goG2YRI_zNPt3af2lkPqXD796IKC5URrEvcgF5xFQ-6h07XRDpSRx1ECrNsUOt7UM3l1IB4doY11GzwQA5sHDTmUZ0-kBT76ZMf12Srg_N3hZwphxBtudYtN5VGZn420sVrQMdPE_7Ni3EiWT88j7WCr1xrF60l8sZT3yKCVleG7D2BEXacTntB7GktBv4Xo8OKnpwpqTpIlC05dMowMkz3rEAAYbQ
      puts token
      
      decoded_token = JWT.decode payload, rsa_public, true, { algorithm: 'RS256' }
      
      # Array
      # [
      #   {"data"=>"test"}, # payload
      #   {"alg"=>"RS256"} # header
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
