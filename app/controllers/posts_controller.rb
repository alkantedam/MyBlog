class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :show, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new', danger: "Post wasn't created"
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Post successfully updated'
    else
      render 'edit', danger: 'Something went wrong'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
