class UsersController < ApplicationController
  def show
  @user = User.find_by(id: params[:id])
  @radios = current_user.radios
  end
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
  
  private
  def radio_params
    params.require(:radio).permit(:audio,:title,:description)
  end

end
