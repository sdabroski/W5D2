class PostsController < ApplicationController
  before_action :require_login
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    @post.save
    flash[:errors] = @post.errors.full_messages
    redirect_to post_url(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      flash[:errors] = "Post Successful!"
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to subs_url
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids:[])
  end
end
