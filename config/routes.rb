Rails.application.routes.draw do
  resources :schedules
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  Rails.application.routes.draw do
    resources :schedules do
      collection do
        get 'expired_schedules'
      end
    end
  end
  
  # Defines the root path route ("/")
  # root "articles#index"
end
