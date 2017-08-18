Rails.application.routes.draw do
  root 'main#index'

  get 'main/index'
  get 'main/search'
  get 'mypage/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
