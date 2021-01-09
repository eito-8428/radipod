class RadiosController < ApplicationController
  protect_from_forgery :except => [:destroy]
  before_action :ensure_user, only: [:edit, :update, :destroy]
  
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