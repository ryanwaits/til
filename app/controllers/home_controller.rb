class HomeController < ApplicationController
  def index
    @author = session[:author_id]
    @posts = Post.all
  end
end
