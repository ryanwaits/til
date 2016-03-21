class SessionsController < ApplicationController
  def new
        
  end

  def create
    author = Author.find_by_email(params[:session][:email])
    if author && author.authenticate(params[:session][:password])
        session[:author_id] = author.id
        redirect_to root_path
    else
        redirect_to login_path
    end
  end

  def destroy
    session[:author_id] = nil
    redirect_to login_path
  end
end
