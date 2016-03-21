class AuthorsController < ApplicationController
    before_action :set_author, only: [:edit, :show]
  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)

    @author.save ? (redirect_to root_path) : (render 'new' && flash[:notice] = "Try again")
  end

  def show
    @posts = Author.find(session[:author_id]).posts
  end

  def destroy

  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:username, :email, :password, :password_digest)
  end
end
