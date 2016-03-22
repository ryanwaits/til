module LikesHelper
    def not_authorized?
        author = session[:author_id]
        my_posts = Author.find(author).posts
        my_posts_ids = []
        my_posts.each do |post|
            my_posts_ids.push(post.id)
        end

        return my_posts_ids.include?(params[:post_id].to_i)

    end

    def already_liked?(post)
        post.author.likes.find_by_post_id(post)
    end
end
