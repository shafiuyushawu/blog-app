class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_author_id])
    @like = @post.likes.new(author: current_user)

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render.new
    end
  end
end
