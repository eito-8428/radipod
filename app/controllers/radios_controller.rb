class RadiosController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]
  before_action :login_check, only: [:new, :create,:edit, :update, :destroy]
  def show
    @radio = Radio.find(params[:id])
    @comments = @radio.comments
    @comment = @radio.comments.build
  end

  
  def index
    @radios = Radio.all.includes(:favorite_users)
  end
  
  def new
    @radio = Radio.new
  end

  def create
    @radio = current_user.radios.new(radio_params)

    if @radio.save
      redirect_to radios_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def edit

  end

  def update

    if @radio.update(radio_params)
      redirect_to radios_path
    else
      render :edit
    end
  end
  
  def destroy
      @radio = Radio.find(params[:id])
      @radio.destroy
      redirect_to radios_path
  end
  

  private
  def radio_params
    params.require(:radio).permit(:audio,:title,:description)
  end
end

private
  def ensure_user
    @radios = current_user.radios
    @radio = @radios.find_by(id: params[:id])
    redirect_to radio_path unless @radio
  end

private
def redirect_root
  redirect_to root_path unless user_signed_in?
end

private
def login_check
  unless user_signed_in?
    flash[:alert] = "ログインしてください"
    redirect_to root_path
  end
end