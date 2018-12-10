class AccountsController < ApplicationController
  include ShopifyApp::AppProxyVerification
  #before_action :authenticate_user!

  def home
    @user = current_user
  end

end
