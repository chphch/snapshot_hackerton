class MypageController < ApplicationController
  def index
  end

  def toggle_like
    if true
      @like_true = false
      @like_index = 3
      render '/main/toggle_like'
    else
      render '/main/goto_login_page'
    end
  end
end
