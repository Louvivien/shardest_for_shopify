class AccountsController < ApplicationController
  include Secured

  def home
  	@user = session[:userinfo]
  end

end
