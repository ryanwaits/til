class SessionsController < ApplicationController
  def new
        
  end

  def create
    author = Author.find_by_email(params[:session][:email])
    if author && author.authenticate(params[:session][:password])
        session[:author_id] = author.id
        flash[:logged_in] = "Welcome back #{author.username}!"
        redirect_to root_path
    else
      flash[:logged_in] = "Your email or password was incorrect, try again."
        redirect_to login_path
    end
  end

  def destroy
    session[:author_id] = nil
    flash[:logged_out] = "You successfully logged out."
    redirect_to root_path
  end
end
