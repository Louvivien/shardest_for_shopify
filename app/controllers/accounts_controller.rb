class AccountsController < ApplicationController
  include ShopifyApp::AppProxyVerification


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
