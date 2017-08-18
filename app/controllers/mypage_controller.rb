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
end
