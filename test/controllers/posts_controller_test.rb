require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @post = posts(:one)
    @user = users(:one)
    @user2 = users(:two)
  end

  # A visitor can see all posts
  test "visitor should see all" do
    get posts_url
    assert_response :success
  end

  # A visitor can see a specific post
  test "visitor should show" do
    get post_url(@post)
    assert_response :success
  end

  # A user should be able to create a post
  test "user should create" do
    sign_in @user
    get new_post_url
    assert_response :success

    assert_difference("Post.count", 1) do
      post posts_url, params: { post: { title: "Title", content: "Content" } }
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h4", text: "Title"
  end

  # A visitor should not be able to create a post
  test "visitor should not create" do
    get new_post_url
    assert_redirected_to new_user_session_url

    assert_difference("Post.count", 0) do
      post posts_url, params: { post: { title: "Title", content: "Content" } }
    end
  end

  # An user can edit their own post
  test "user should edit" do
    sign_in @user
    get edit_post_url(@post)
    assert_response :success

    patch post_url(@post), params: { post: { title: "Title", content: "Content" } }
    assert_redirected_to post_url(@post)
  end

  # An user can not edit another user's posts
  test "user should not edit" do
    sign_in @user2
    get edit_post_url(@post)
    assert_redirected_to posts_url
  end

  # A visitor can not edit a post
  test "visitor should not edit" do
    get edit_post_url(@post)
    assert_redirected_to new_user_session_url
  end

  # An user can delete their own post
  test "user should destroy" do
    sign_in @user
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end
    assert_redirected_to posts_url
  end 

  # An user can not delete another user's post
  test "user should not destroy" do
    sign_in @user2
    assert_difference("Post.count", 0) do
      delete post_url(@post)
    end
    assert_redirected_to posts_url
  end

  # An visitor can not delete a post
  test "visitor should not destroy" do
    assert_difference("Post.count", 0) do
      delete post_url(@post)
    end
    assert_redirected_to new_user_session_url
  end


end
