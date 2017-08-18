class MypageController < ApplicationController
  def index
    @likes = current_user.likes.all
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_url
    end
  end

  def toggle_like
    puts "TOGGLE LIKE"
    puts params[:productId]
    if true
      @like_true = false
      @like_index = 11879922068
      render '/main/toggle_like'
    else
      render '/main/goto_login_page'
    end
  end
end
