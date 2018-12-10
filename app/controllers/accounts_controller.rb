class AccountsController < ApplicationController
  include ShopifyApp::AppProxyVerification


  def home
    puts params[:user]
    puts session[:user][:picture]
    @user = params[:user]
  end

end
