Rails.application.routes.draw do
  root "articles#index"
  get 'students/index'
  get 'students/new'
  get 'registration/register'
  post "regs",to:'registration#registerlogics'
  get 'registration/login'
  post 'registration/login'
  resources :articles do
    resources :comments
  end
  resources :courses do
    resources :students
  end
end
