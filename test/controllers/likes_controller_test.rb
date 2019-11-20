require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest

  def set_up
    @post = posts(:orange)
  end
  
  test "should get create" do
    get post_likes_path(@post)
    assert_response :success
  end

  test "should get destroy" do
    get post_like_path(@post, @post.likes.find_by(user_id: current_user.id))
    assert_response :success
  end

end
