class FavoritesController < ApplicationController
  def index
    @user = current_user
    @post = @user.posts.all
    @favorites = Favorite.where(user_id: @user.id).all.page(params[:page])
  end
  def create
    @favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_url
  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_url
  end
end
