class PostsController < ApplicationController
  before_action :authenticate_user,except:[:index,:show]
  before_action :ensure_correct_post,only:[:edit,:update,:destroy]
  def index
    @posts = Post.includes(:user).order('id DESC').limit(10).page(params[:page]).per(7)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @like =Like.find_by(post_id: @post.id)
    @likecount = Like.where(post_id: @post.id).count
    @comments = @post.comments.includes(:user)
    @tags =@post.tags
  end

  def new 
    @post= Post.new
  end

  def create
    # binding.pry
    # @post = Post.new(title: params[:title],content: params[:content])
    @post = Post.new(create_params)
    if @post.save
      flash[:notice]= "新規投稿完成しました。"
      redirect_to root_path
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    if Post.find_by(id: params[:id]).update(introduction_params)
      flash[:notice] = "投稿を編集しました"
      redirect_to root_path
    else 
      render("posts/edit")
    end
  end
    

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy if @post.user_id == @current_user.id
    flash[:notice]="投稿を削除しました"
    redirect_to root_path
  end

  def ensure_correct_post
    @post=Post.find_by(id: params[:id])
    if @current_user.id != @post.user_id
      redirect_to root_path,notice:"他の人の投稿です"
    end
  end

  private
  def introduction_params
    params.require(:post).permit(:title, :content,:user_id,:all_tags)
  end

  def create_params
    params.require(:post).permit(:title, :content,:user_id,:all_tags)
  end
end
