class AccountsController < ApplicationController
  include ShopifyApp::AppProxyVerification

  def home
  	@user = session[:userinfo]
  end

end
