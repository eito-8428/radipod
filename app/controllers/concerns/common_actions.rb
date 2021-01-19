module CommonActions
  extend ActiveSupport::Concern

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def login_check
    unless logged_in? 
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end
end