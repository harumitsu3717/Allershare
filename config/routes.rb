Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions:'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    get '/search' => 'searches#search'
    patch 'withdrawal/:id' => 'users#withdrawal', as: 'withdrawal'
    resources :posts, only: [:show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
    resources :users, only: [:show]
  end

  scope module: :public do
    devise_for :users
    root to: 'homes#top'
    resources :posts, only: [:new, :create, :index, :show, :destroy] do
      resources :post_comments, only: [:create, :edit, :destroy]
      resource :favorite, only: [:create, :destroy]
    end
    resources :users, only: [:edit, :show, :index, :update]
    get 'mypage' => 'users#mypage', as: 'mypage'
    get 'unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'withdraw' => 'users#withdraw', as: 'withdraw'
    get '/search' => 'searches#search', as: 'search'
    get 'posts/:id/post_comments' => 'posts#show'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
