class AccountsController < ApplicationController
  include ShopifyApp::AppProxyVerification


  def home
    puts session[:userinfo]
    puts session[:userinfo][:picture]
    @user = session[:userinfo]
  end

end
