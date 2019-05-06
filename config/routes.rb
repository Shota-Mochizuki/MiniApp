Rails.application.routes.draw do
  
  devise_for :users
  get 'articles' => 'articles#index'
  root  'articles#index'
  resources :articles, only: [:index, :new, :create, :destroy, :update, :show, :edit]
end
