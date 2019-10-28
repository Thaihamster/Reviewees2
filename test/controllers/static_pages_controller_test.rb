require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Reviewees"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "Reviewees"
  end

  test "should get privacy" do
    get static_pages_privacy_url
    assert_response :success
    assert_select "title", "Reviewees"
  end

end
