class LikesController < ApplicationController
  def new
    
  end

  def create
    @like = Like.create(author_id: session[:author_id], post_id: params[:post_id])

    if @like.save
        redirect_to root_path
    else
        flash[:like] = "You are not authorized to like posts yet, please sign in."
        redirect_to root_path
    end
  end
end
