module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    puts session[:userinfo]
    redirect_to 'https://shardest.com/a/account/auth/auth0' unless session[:userinfo].present?
  end
end