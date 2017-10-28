require 'test_helper'

class CollagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get collages_index_url
    assert_response :success
  end

  test "should get show" do
    get collages_show_url
    assert_response :success
  end

end
