class AccountsController < ApplicationController
  include ShopifyApp::AppProxyVerification
  #include Secured

  def home
    puts session[:userinfo]
  	@user = session[:userinfo]
  end

end
