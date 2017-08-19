class MypageController < ApplicationController
  before_action :authenticate_user!

  def index
    @likes = current_user.likes.all
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_url
    end
  end

  def toggle_like
    @data_id = params[:index]
    url = params[:link]

    like = Like.where(url: url).take

    if like
      like.destroy
    else
      like = Like.new
      like.title = params[:title]
      like.price = params[:price]
      like.url = params[:link]
      like.image = params[:image]
      like.shopping_mall = params[:mallName]
      like.user_id = current_user.id
      like.save
    end
  end
end
