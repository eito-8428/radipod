require 'test_helper'

class RadiosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get radios_new_url
    assert_response :success
  end

end
