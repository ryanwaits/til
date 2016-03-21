class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]
  def new
    @post = Post.new
  end

  def create
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
    @post = Post.new(post_params)
    @post.body = markdown.render(@post.body)
    @post.author_id = session[:author_id]
    
    @post.save ? (redirect_to(root_path)) : (render 'new')
    
  end

  def edit
  end

  def destroy
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :hashtag)
  end
end
