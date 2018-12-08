class Auth0Controller < ApplicationController
  include ShopifyApp::AppProxyVerification
	def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env['omniauth.auth']
    puts session[:userinfo]
    # Redirect to the URL you want after successful auth
    redirect_to 'https://shardest.com/a/account',  shop: 'shop', path_prefix: 'path_prefix', timestamp: 'timestamp',  signature: 'signature'
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
end
