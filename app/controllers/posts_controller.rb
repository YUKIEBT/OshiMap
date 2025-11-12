class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       flash[:notice] = "投稿を更新しました。"
       redirect_to post_path(@post)
    else
      flash.now[:alert] = "投稿を更新できませんでした。"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to posts_path
  end

  private

  def post_params
  params.require(:post).permit(:title, :body, :image, :address, :latitude, :longitude, :source_url)
  end

  def is_matching_login_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path, alert: "この投稿を編集する権限はありません。"
    end
  end
end
