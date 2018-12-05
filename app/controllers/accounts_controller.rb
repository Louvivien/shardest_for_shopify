class AccountsController < ApplicationController
  include Secured
  include ShopifyApp::AppProxyVerification

  def home
  	@user = session[:userinfo]
  end

end
