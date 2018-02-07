Rails.application.routes.draw do





  get 'themed_pages/construction'

  get 'themed_pages/about'

  get 'themed_pages/contact'
  get 'themed_pages/landing'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }

  resources :activities
  resources :departments

  
  get 'about-swaf', to: 'static_pages#about'

  get 'contact-us', to: 'static_pages#contact'

  get 'help', to: 'static_pages#help'

  root to: 'static_pages#home'	

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
