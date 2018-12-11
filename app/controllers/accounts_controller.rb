class AccountsController < ApplicationController
  include ShopifyApp::AppProxyVerification


  def home
    puts cookies[:user_info]
    @user = cookies[:user_info]
  end

end
