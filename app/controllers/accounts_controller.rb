class AccountsController < ApplicationController
  include ShopifyApp::AppProxyVerification


  def home
    puts user
    @user = user
  end

end
