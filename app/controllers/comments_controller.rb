class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(text: comment_params[:text], post_id: params[:post_id], author_id: current_user[:id])

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment created successfully.'
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]), notice: 'Comment deleted successfully'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
