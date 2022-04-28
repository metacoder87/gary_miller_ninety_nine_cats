Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, except: :destroy

  resources :cats_rental_requests, only: [:create, :new] do
    member do
      post :approve
      post :deny
    end
  end
  
  root to: redirect('/cats')
end
