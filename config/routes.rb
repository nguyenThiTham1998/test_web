Rails.application.routes.draw do
  get 'profiles/edit'
  get 'profiles/show'
  get 'profiles/new'
  get 'exams/new'
  get 'exams/edit'
  get 'exams/show'
  get 'exams/destroy'
  get 'answers/new'
  get 'answers/edit'
  get 'question/new'
  get 'question/edit'
  get 'subjects/new'
  root 'static_pages#home'
  get 'static_pages/home'
  devise_for :users
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
  end
  resources :subjects
  resources :questions
  resources :answers
  resources :exams
  resources :profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
