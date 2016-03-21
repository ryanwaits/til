class StatsController < ApplicationController
    include StatsHelper
    include AuthorsHelper
  def index
    @author = session[:author_id]
    if @author
        build_graph(session[:author_id])
    else
        flash[:access] = "You must be logged in to see your stats."
        redirect_to login_path
    end
  end

end
