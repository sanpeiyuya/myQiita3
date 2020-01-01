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
    @user = User.new(name: params[:name],email:params[:email],nickname:params[:nickname])
    if @user.save
      flash[:notice]= "新規登録できました"
      redirect_to users_path
    else
      render("users/new")
    end
  end
end
