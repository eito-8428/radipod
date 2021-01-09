class FavoritesController < ApplicationController
  def index
  @favorite_radios = current_user.favorite_radios
  end
  
  def create
  favorite = Favorite.new
  favorite.user_id = current_user.id
  favorite.radio_id = params[:radio_id]
  
  
  if favorite.save
    redirect_to radios_path, success: 'お気に入りに登録しまた'
  else
    redirect_to radios_path, danger: 'お気に入りに失敗しました'
  end
  end
  
  def destroy
  Favorite.find_by(params[:radio_id]).destroy
  flash[:success] = "お気に入りを解除しました"
  redirect_to radios_path
  end
end
