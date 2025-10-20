class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
  params.require(:post).permit(:title, :body, :address, :latitude, :longitude, :source_url)
  end
end
