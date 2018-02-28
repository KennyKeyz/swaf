Rails.application.routes.draw do





  resources :reports
  resources :sectors

  get 'construction', to: 'themed_pages#construction'

  get 'about', to: 'themed_pages#about'

  get 'user-dashboard', to: 'themed_pages#landing'

  get 'contact', to: 'themed_pages#contact'


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }

  resources :activities do
    member do
      get :toggle_status
    end
  end 

  get 'approval-list', to: 'activities#approvals'
  get 'staff-approved-list', to: 'activities#staffapproved'
  get 'staff-rejected-list', to: 'activities#staffrejected'
  get 'staff-pending-list', to: 'activities#staffpending'
  get 'sector-approval-list', to: 'activities#sectorapprovals'


  

  get 'base-report', to: 'activities#basereport'

  post 'base-report', to: 'activities#basereport'
  



  resources :departments

  
  get 'about-swaf', to: 'static_pages#about'

  get 'contact-us', to: 'static_pages#contact'

  get 'help', to: 'static_pages#help'

  root to: 'static_pages#home'	

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
