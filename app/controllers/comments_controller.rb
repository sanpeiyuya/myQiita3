class CommentsController < ApplicationController
  def create
    @comment=Comment.create(comment_params)
    respond_to do |format|
      format.html {redirect_to post_path(params[:post_id]),notice:"コメント作成しました。"}
      format.json
      # if @comment.save
      #   redirect_to post_path(params[:post_id]),notice:"コメント作成しました。"
      # else
      #   redirect_to post_path(params[:post_id]),notice:"コメントを入力してください"
      # end  }
    end
    
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
      respond_to do |format|
        format.js
        format.html
      end
    # redirect_to post_path(params[:post_id])
  end

  private 
  def comment_params
    params.permit(:text,:post_id).merge(user_id: @current_user.id)
  end
end
