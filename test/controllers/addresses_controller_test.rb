require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get addresses_search_url
    assert_response :success
  end
end
