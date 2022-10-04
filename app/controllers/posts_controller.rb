class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
 

  def index
    @posts = Post.all
  end

  def new
    # @post = current_user.posts.new
    @post = Post.new
  end

  def create
    # @post = current_user.posts.new(post_params)
    @post = Post.new(post_params)
    @post.user = current_user
     if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def show
    @post = Post.find(params[:id])

  end

  def destroy
    # @post = Post.find(params[:id])
    if @post.present?
      @post.destroy
      redirect_to root_path, notice: "Post was successfully deleted."
    end
  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
  # @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to @post, notice: "Post was successfully updated."
    else
    render :edit, status: :unprocessable_entity
    end
  end

  private

    def require_user
      redirect_to root_path unless @post.user == current_user
      flash[:notice] = "Unauthorized Action."
    end

    def set_post
      @post = Post.find(params[:id])
    end


    def post_params
      params.require(:post)
            .permit(:title, :description)
    end
end