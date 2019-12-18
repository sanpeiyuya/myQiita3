class PostsController < ApplicationController
  def index
    @posts = Post.order('id DESC').limit(5)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new 
    
  end

  def create
    # binding.pry
    # @post = Post.new(title: params[:title],content: params[:content])
    @post = Post.new(content:params[:content],title:params[:title],user_id:params[:user_id])
    if @post.save
      redirect_to root_path
    else
      render 'posts/new'
    end
  end
end
