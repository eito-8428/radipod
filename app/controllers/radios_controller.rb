class RadiosController < ApplicationController
  protect_from_forgery :except => [:destroy]

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
   @radio = Radio.find(params[:id])
  end

  def update
    @radio = Radio.find(params[:id])
    if @radio.update(radio_params)
      redirect_to radios_path
    else
      render :new
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