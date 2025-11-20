class Public::SearchesController < ApplicationController
  def search
    @result = []
    if params[:keyword].present?
      case params[:model]
      when "User"
        @result = User.search_for(params[:keyword], params[:method])
      when "Post"
        @result = Post.search_for(params[:keyword], params[:method])
      end
    end
  end
end
