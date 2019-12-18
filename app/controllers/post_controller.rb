class PostController < ApplicationController
  def index
    @posts = Post.order('id DESC').limit(5)
  end

end
