Rails.application.routes.draw do
  get 'searches/search'
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions:'admin/sessions'
  }

  scope module: :public do
    devise_for :users
    root to: 'homes#top'
    resources :posts, only: [:new, :create, :index, :show, :destroy]
    resources :users, only: [:edit, :show, :index, :update]
    get 'mypage' => 'users#mypage', as: 'mypage'
    get 'unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'withdraw' => 'users#withdraw', as: 'withdraw'
    get '/search' => 'searches#search', as: 'search'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
