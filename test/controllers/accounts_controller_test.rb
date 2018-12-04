require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get accounts_home_url
    assert_response :success
  end

end
