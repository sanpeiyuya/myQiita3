class LikesController < ApplicationController
  def create
    @like =Like.new(likes_params)
    @like.save
    redirect_to post_path(params[:post_id]) ,notice:"いいね！"
  end

  def destroy
    @like = Like.find_by(user_id: @current_user.id ,post_id: params[:id].to_i)
    @like.destroy
    redirect_to post_path(params[:post_id])  ,notice:"いいねを削除しました"
  end
  private
  def likes_params
    params.permit(:post_id).merge(user_id: @current_user.id)
  end
end
