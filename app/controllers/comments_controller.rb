class CommentsController < ApplicationController
    before_action :set_post
    before_action :authenticate_user!

    def create
        @comment = @post.comments.create(params[:comment].permit(:content))
        @comment.user_id = current_user.id
        @comment.save
        redirect_to @post
    end

    private
        def set_post
            @post = Post.find(params[:post_id])
        end
end
