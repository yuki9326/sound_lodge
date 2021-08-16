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
    get 'end_users/confirm' => 'end_users#confirm'
    patch 'end_users/unsubscribe' => 'end_users#unsubscribe'
    resources :end_users, only:[:show, :edit,:update]
    resources :musician_profiles, except:[:destroy] do
      resources :reviews, only:[:index,:create]
      resources :favorites, only:[:create, :destroy]
    end
    resources :shop_profiles, except:[:destroy] do
      resources :reviews, only:[:index,:create]
      resources :favorites, only:[:create, :destroy]
    end
    post 'contacts/confirm' => 'contacts#confirm'
    post 'contacts/back' => 'contact#back'
    get 'contacts/thanks' => 'contacts#thanks'
    resources :contacts, only:[:new,:create]
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :musician_profiles, only:[:show]
    resources :shop_profiles, only:[:show]
    resources :end_users, only:[:index,:show,:edit,:update]
  end
end
