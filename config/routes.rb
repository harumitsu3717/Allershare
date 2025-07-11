Rails.application.routes.draw do
  
  get 'users/edit'
  get 'users/show'
  get 'users/update'
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions:'admin/sessions'
  }

  scope module: :public do
    devise_for :users
    root to: 'homes#top'
    get 'homes/about'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
