class LikesController < ApplicationController
  include LikesHelper
  def new
    
  end

  def create
    if not_authorized?
      flash[:like] = "You can't like your own posts, nice try though."
      redirect_to root_path
    else
      @author = session[:author_id]
      like = Like.create(author_id: @author, post_id: params[:post_id])

      if like.save
          flash[:like] = "Like saved!"
          
      else
          flash[:like] = "You are not authorized to like posts yet, please sign in."
          
      end
    end
  end
end
