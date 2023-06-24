class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @likes = Like.create(author_id: @user.id, post_id: params[:post_id])
    if @likes.save
      redirect_to user_post_path(author_id:current_user[:id], id: params[:post_id])
    end
  end
end
