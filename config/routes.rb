Rails.application.routes.draw do
  namespace 'api' do    
    resources :books
    resources :list_items
    resources :users

    post '/auth/login', to: 'authentication#login'
    post '/auth/signup', to: 'users#create'

    post 'search' => 'books#search_title'
    get 'reading_list' => 'list_items#reading_list'
    get 'finished' => 'list_items#finished'
    
    get '/current_user', to: 'current_user#index'
  end
end
