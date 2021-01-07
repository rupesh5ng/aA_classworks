Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :goals ,only: [:index,:show]
  end
  resource :session, only: [:destroy, :new, :create]
  resources :goals , only: [:create,:new,:destroy,:update,:edit]
end
