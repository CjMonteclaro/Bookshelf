Rails.application.routes.draw do
  namespace 'api' do
    devise_for :users, path: '', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
    
    resources :books
    resources :list_items
    resources :users

    get 'reading_list' => 'list_items#reading_list'
    get 'finished' => 'list_items#finished'
    
    get '/current_user', to: 'current_user#index'
  end
end
