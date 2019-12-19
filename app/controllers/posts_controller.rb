class PostsController < ApplicationController
  def index
    @posts = Post.order('id DESC').limit(5)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new 
    @post= Post.find_by(id: params[:id])
  end

  def create
    # binding.pry
    # @post = Post.new(title: params[:title],content: params[:content])
    @post = Post.new(create_params)
    if @post.save
      redirect_to root_path
    else
      render 'posts/new'
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    if Post.find_by(id: params[:id]).update(introduction_params)
      redirect_to root_path, notice: '更新成功しました'
    else 
      render("posts/edit")
    end
  end
    

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to root_path
  end


  private
  def introduction_params
    params.require(:post).permit(:title, :content,:user_id)
  end

  def create_params
    params.permit(:title, :content,:user_id)
  end
end
