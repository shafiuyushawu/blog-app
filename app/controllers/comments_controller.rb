class CommentsController < ApplicationController
  def new
    @user = User.includes(posts: :comments).find(params[:user_id])
    @post = @user.posts.find(params[:post_author_id])
    @comment = @post.comments.build
  end

  def create
    @user = User.includes(posts: :comments).find(params[:user_id])
    @post = @user.posts.find(params[:post_author_id])
    @comment = @post.comments.new(author: current_user, **comment_params)

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment created successfully.'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
