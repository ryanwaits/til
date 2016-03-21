module StatsHelper

    def build_posts_graph(author)
        if author
            likes = []
            titles = []
            author = Author.find(session[:author_id])
            author.posts.each do |post|
                likes.push(post.likes.count)
                titles.push(post.title.truncate(28))
            end

            @data = {
                labels: titles,
                datasets: [
                    {
                        label: "My First dataset",
                        fillColor: "rgba(246, 53, 51, 0.7)",
                        strokeColor: "rgba(246, 53, 51, 0.9)",
                        pointColor: "rgba(220,220,220,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: likes
                    }
                ]
            }
            @options = {}
        else
            redirect_to root_path
        end
    end

    def build_hashtags_graph
        counts = Hash.new(0)
        hashtags = []
        @posts = Post.all
        @posts.each do |post|
            hashtags.push(post.hashtag)
        end
        hashtags.each { |hash| counts[hash] += 1 }
        
        @data = {
            labels: counts.keys,
            datasets: [
                {
                    label: "My First dataset",
                    fillColor: "rgba(246, 53, 51, 0.7)",
                    strokeColor: "rgba(246, 53, 51, 0.9)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: counts.values
                }
            ]
        }
        @options = {}
    end
end
