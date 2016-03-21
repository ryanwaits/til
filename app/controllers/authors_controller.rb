class AuthorsController < ApplicationController
    before_action :set_author, only: [:edit, :show]
  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)

    if @author.save
      flash[:signup] = "Thanks for signing up <% @author.username %>"
      redirect_to root_path
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
