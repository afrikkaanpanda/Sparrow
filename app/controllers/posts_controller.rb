class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
     if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def show
    @post = Post.find_by(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.present?
      @post.destroy
      redirect_to posts_url, notice: "Post was successfully deleted."
    end
  end

  private

    def post_params
      params.require(:post)
            .permit(:author, :title, :description)
    end
end