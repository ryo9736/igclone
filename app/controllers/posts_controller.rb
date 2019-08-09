class PostsController < ApplicationController
  before_action :set_posts, only:[:show, :edit, :destroy, :update]
  before_action :ensure_correct_user, only:[:edit, :destroy, :update]

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      #ImageMailer.image_mailer(@post).deliver
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
  end

  def index
    @posts = Post.page(params[:page])
  end

  def show
    @user = @post.user
    @favorite = current_user.favorites.find_by(post_id:@post.id)
  end

  def edit
    @user = @post.user
  end

  def update
    @post.user_id = current_user.id
    if @post.update(post_params)
       redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:image,:image_cache)
  end

  def set_posts
    @post = Post.find(params[:id])
  end

  def ensure_correct_user
    if @post.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end
end