class UsersController < ApplicationController
  before_action :set_user, only:[:show,:edit,:update,:destroy]
  before_action :user_identify, only:[:edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:info] = "Create Acount"
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    #@user_id = current_user.id
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end

  def user_identify
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to users_path
    end
  end
end