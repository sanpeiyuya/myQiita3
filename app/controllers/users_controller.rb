class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create)
    if @user.save
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

  private
  def user_params
    params.require(:user).permit(:name, :email,:nickname)
  end

  def user_create
    params.permit(:name,:email,:nickname,:user_image)
  end
end
