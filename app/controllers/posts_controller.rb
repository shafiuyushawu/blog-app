class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @post = @user.posts.includes(:comments).find(params[:author_id])
    else
      @post = Post.includes(:comments).find(params[:id])
    end
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = Current.user.id
    if @post.save
      redirect_to user_posts_path(Current.user)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
# class PostsController < ApplicationController
#   def index
#     @user = User.find(params[:user_id])
#     @posts = @user.posts.includes(:comments) # Eager loading comments
#   end

#   def show
#     if params[:user_id].present?
#       @user = User.find(params[:user_id])
#       @post = @user.posts.includes(:comments).find(params[:author_id]) # Eager loading comments
#     else
#       @post = Post.includes(:comments).find(params[:id]) # Eager loading comments
#     end
#     @comments = @post.comments
#   end

#   def new
#     @post = Post.new
#   end

#   def create
#     @post = Post.new(post_params)
#     @post.author_id = Current.user.id
#     if @post.save
#       redirect_to user_posts_path(Current.user)
#     else
#       render :new
#     end
#   end

#   private

#   def post_params
#     params.require(:post).permit(:title, :text)
#   end
# end
