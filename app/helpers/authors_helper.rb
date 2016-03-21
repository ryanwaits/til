module AuthorsHelper
    def logged_in?(author)
        author ? true : false
    end

    def login(author)
        session[:author_id] = author.id
        redirect_to root_path
    end
end
