require "test_helper"

class Companies::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get companies_posts_new_url
    assert_response :success
  end

  test "should get edit" do
    get companies_posts_edit_url
    assert_response :success
  end

  test "should get show" do
    get companies_posts_show_url
    assert_response :success
  end
end
