Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  devise_for :end_users, controllers: {
  sessions:      'end_users/sessions',
  passwords:     'end_users/passwords',
  registrations: 'end_users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'confirm' => 'end_users#confirm'
    patch 'unsubscribe' => 'end_users#unsubscribe'
    resources :end_users, only:[:show, :edit,:update]
  end

  namespace :admin do
    get '/' => 'homes#top'
  end
end
