class LikesController < ApplicationController
  before_action :set_likeID
  def create
    @like =@current_user.likes.new(post_id: params[:post_id])
    @like.save
    render 'create-like.js.erb'
    # redirect_to post_path(params[:post_id]) ,notice:"いいね！"
  end

  def destroy
    # @like = Like.find_by(user_id: @current_user.id ,post_id: params[:id])
    @like = Like.find_by(id: params[:id],user_id: @current_user.id)
    @like.destroy
    render 'delete-like.js.erb'
    # redirect_to post_path(params[:post_id])  ,notice:"いいねを削除しました"
  end
  private
  # def likes_params
  #   params.permit(:post_id).merge(user_id: @current_user.id)
  # end
  def set_likeID
    @post = Post.find(params[:post_id])
    @id_name = "#like-btn-#{@post.id}"
  end
end
