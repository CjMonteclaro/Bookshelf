Rails.application.routes.draw do
  devise_for :users
  namespace 'api' do
    resources :books
    resources :list_items
    resources :users

    get 'reading_list' => 'list_items#reading_list'
    get 'finished' => 'list_items#finished'
    
    get '/current_user', to: 'current_user#index'
    
    devise_for :users, path: '', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  end

end
