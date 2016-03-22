class HomeController < ApplicationController
  def index
    @author = session[:author_id]
    if params[:hashtag]
        @posts = Post.where(hashtag: params[:hashtag])
    else
        @posts = Post.all
    end
  end
end
