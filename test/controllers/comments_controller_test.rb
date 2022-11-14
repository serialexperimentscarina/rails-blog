require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @user = users(:one)
    @comment = comments(:two)
  end

  # User should be able to comment on a post
  test "user should comment" do
    sign_in @user

    assert_difference("Comment.count", 1) do
      post post_comments_url(@post), params: { comment: {content: "Content" }, post_id: 1 }
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  # Visitor should not be able to comment on a post
  test "visitor should not comment" do
    assert_difference("Comment.count", 0) do
      post post_comments_url(@post), params: { comment: {content: "Content" }, post_id: 1 }
    end
    assert_redirected_to new_user_session_url
  end

end
