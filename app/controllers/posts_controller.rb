class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to post_path(@post.id)
      else
        render 'new'
      end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id_ = current_user.id
    if @post.update(post_params)
       redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:image,:image_cash)
  end
end
