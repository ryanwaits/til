class AuthorsController < ApplicationController
    before_action :set_author, only: [:edit, :show]
    include AuthorsHelper
  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)

    if @author.save
      login(@author)
      flash[:signup] = "Thanks for signing up!"
    else
      flash[:signup] = "Try again"
      render 'new'
    end
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
