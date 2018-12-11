class AccountsController < ApplicationController
  include ShopifyApp::AppProxyVerification


  def home
    puts params[:user]
    @user = params[:user]
  end

end
