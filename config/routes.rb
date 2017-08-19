Rails.application.routes.draw do
  root 'main#index'

  get 'main/index'
  post 'main/search'
  get 'main/search'
  get 'card/index'
  get 'mypage/index'

  get 'mypage/toggle_like'

  # 임시
  post 'main/put_image'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
