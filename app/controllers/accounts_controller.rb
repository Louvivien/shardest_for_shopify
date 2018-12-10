class AccountsController < ApplicationController
  #include ShopifyApp::AppProxyVerification
  include Secured

  def home
  	@user = session[:userinfo]
  end

  def update
  end

  def show
  end

end
