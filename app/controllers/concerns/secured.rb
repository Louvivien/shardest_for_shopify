module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    redirect_to 'https://shardest.com/a/account/auth/auth0/callback', shop: 'shop', path_prefix: 'path_prefix', timestamp: 'timestamp',  signature: 'signature' unless session[:userinfo].present?
  end
end