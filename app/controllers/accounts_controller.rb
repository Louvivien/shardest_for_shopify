class AccountsController < ApplicationController
  include ShopifyApp::AppProxyVerification
  #before_action :authenticate_user!

  def home
    puts session[:userinfo]
    @current_user = session[:userinfo]
    @user = current_user
  end

end
