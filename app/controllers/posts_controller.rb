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
      redirect_to root_path, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.present?
      @post.destroy
      redirect_to root_path, notice: "Post was successfully deleted."
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
  end
end



  private

    def post_params
      params.require(:post)
            .permit(:author, :title, :description)
    end
end