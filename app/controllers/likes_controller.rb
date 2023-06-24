class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    # @post = Post.find(params[:post_id])
    @likes = Like.create(author_id: @user.id, post_id: params[:post_id])
    # @like.save
    if @likes.save
      redirect_to user_post_path(author_id:current_user[:id], id: params[:post_id])
    # else
    #   render.new
    end
  end
end
