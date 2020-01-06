class CommentsController < ApplicationController
  def create
    comment=Comment.new(text:comment_params[:text],post_id: comment_params[:post_id],user_id:@current_user.id)
    if comment.save
      redirect_to post_path(params[:post_id]),notice:"コメント作成しました。"
    else
      redirect_to post_path(params[:post_id]),notice:"コメントを入力してください"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to post_path(params[:post_id])
  end

  private 
  def comment_params
    params.permit(:text,:post_id)
  end
end
