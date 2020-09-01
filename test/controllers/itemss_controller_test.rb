require 'test_helper'

class ItemssControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get itemss_index_url
    assert_response :success
  end

end
