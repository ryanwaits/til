class Author < ActiveRecord::Base
    has_secure_password
    has_many :posts
    has_many :likes
    has_many :liked_posts, through: :likes, source: :post
end
