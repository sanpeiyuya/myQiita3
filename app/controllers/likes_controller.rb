class LikesController < ApplicationController
  def create
    @like =Like.new(user_id: @current_user.id ,post_id: params[:post_id])
    @like.save
    redirect_to post_path(params[:post_id]) ,notice:"いいね！"
  end

  def destroy
    @like = Like.find_by(user_id: @current_user.id ,post_id: params[:id].to_i)
    @like.destroy
    redirect_to post_path(params[:post_id])  ,notice:"いいねを削除しました"
  end
  # private
  # def likes_params
  #   params.require(:like).permit(:user_id, :post_id)
  # end
end
