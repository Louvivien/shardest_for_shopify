class AccountsController < ApplicationController
  include ShopifyApp::AppProxyVerification
  before_action :authenticate_user!

  def home
    include Auth0Helper
  end

end
