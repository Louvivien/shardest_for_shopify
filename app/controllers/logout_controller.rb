class LogoutController < ApplicationController
  include LogoutHelper
  include ShopifyApp::AppProxyVerification

  def logout
    reset_session
    redirect_to logout_url.to_s
  end
  
end
