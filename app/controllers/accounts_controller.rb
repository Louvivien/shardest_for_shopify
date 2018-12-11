class AccountsController < ApplicationController
  #include ShopifyApp::AppProxyVerification
  include Secured

  def home
  	@user = session[:userinfo]
  end

  def update
    @user = session[:userinfo]
  end

  def show
    @user = session[:userinfo]
  end

  def demo4
  end

end
