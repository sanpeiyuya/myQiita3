class UsersController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user,only:[:index,:show,:edit,:update]
  before_action :ensure_correct_user,only:[:edit,:update]
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @current_user.id).order('id DESC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      redirect_to users_path,notice:"新規登録できました"
    else
      render("users/new")
    end
  end

  def edit
    @user= User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: 'ユーザー情報を編集しました'
    else
      render("users/edit")
    end
  end

  def log_in
    @user= User.find_by(email: params[:email],password: params[:password])
    if @user
      session[:user_id]=@user.id
      redirect_to root_path,notice:'ログインしました'
    else
      @error_message="メールアドレスまたはpasswordが間違っています"
      @email=params[:email]
      @password=params[:password]
      render("users/login")
    end
  end

  def login
    @user = User.new
  end

  def logout
    session[:user_id]=nil
    redirect_to root_path,notice:"ログアウトしました"
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      redirect_to root_path,notice:"権限がありません"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email,:nickname,:password,:user_image)
  end
end
