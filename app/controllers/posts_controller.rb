class PostsController < ApplicationController
  def index
    @posts = Post.order('id DESC').limit(10)
  end

  def show
    @post = Post.find_by(id: params[:id])
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
    @post.destroy
    flash[:notice]="投稿を削除しました"
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
