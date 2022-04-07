Rails.application.routes.draw do
  root "articles#index"
  get 'students/index'
  get 'students/new'
  resources :articles do
    resources :comments
  end
  resources :courses do
    resources :students
  end
end
