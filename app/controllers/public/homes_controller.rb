class Public::HomesController < ApplicationController
  before_action :redirect_to_posts_if_sign_in
  layout "top"

  def top
    render layout: "top"
  end

  def about
  end

  private

  def redirect_to_posts_if_sign_in
    redirect_to posts_path if user_signed_in?
  end
end
