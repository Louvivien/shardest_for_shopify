class AccountsController < ApplicationController
  #include ShopifyApp::AppProxyVerification
  include Secured

  def home
  	@user = session[:userinfo]
  end

  def edit_profile
  end

end
