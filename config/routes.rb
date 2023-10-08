Rails.application.routes.draw do
  devise_for :users,controllers: { 
    registrations: 'users/registrations'
  }
  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # ↓テスト中

  resources :users do
    collection do
      get 'account'
      get 'profile'
      get 'account/edit', action: 'edit'
      get 'profile/edit', action: 'edit'
    end
  end

end
