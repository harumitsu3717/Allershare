require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get admin/post_comments" do
    get admin_posts_admin/post_comments_url
    assert_response :success
  end
end
