class CommentsController < ApplicationController
  before_action :set_user_and_post, only: [:new, :create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment created successfully.'
    else
      render :new
    end
  end

  private

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end