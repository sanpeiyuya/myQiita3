class ApplicationController < ActionController::Base
  def set_current_user
    @current_user=User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      redirect_to login_users_path ,notice:"ログインが必要です"
    end
  end
end
