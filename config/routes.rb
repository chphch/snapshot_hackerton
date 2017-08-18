Rails.application.routes.draw do
  get 'search/index'

  get 'main/index'

  get 'main/search'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'main/index'
  get 'main/search'
  get 'card/index'
  get 'mypage/index'

end
