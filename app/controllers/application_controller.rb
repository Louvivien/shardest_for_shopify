class ApplicationController < ActionController::Base
    include ShopifyApp::AppProxyVerification
end
