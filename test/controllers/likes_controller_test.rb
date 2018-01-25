require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get like" do
    get like_like_url
    assert_response :success
  end

  test "should get dislike" do
    get like_dislike_url
    assert_response :success
  end

end
