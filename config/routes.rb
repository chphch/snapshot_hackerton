Rails.application.routes.draw do

  root 'main#index'
  get 'main/index'
  get 'main/main'
  post 'main/search'

  get 'mypage/index'
  get 'mypage/toggle_like'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
