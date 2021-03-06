Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  resources :lessons do
    resources :comments, only: :create
  end
  get 'about', to: 'lessons#about'
  get 'learnmore', to: 'lessons#learnmore'
end
