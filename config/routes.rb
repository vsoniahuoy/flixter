Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  resources :courses, only: [:index, :show]
  resources :lessons, only: [:show]
  namespace :instructor do
    # we don't want the user to mess around or request unreason path, 
    # to prevent that, we do not want to show the full URL path
    # resources :courses, only: [:new, :create, :show] do
    #   resources :sections, only: [:new, :create] do
    #     resources :lessons, only: [:new, :create]
    #   end
    # end

# This line of code indicates that it's dealing with sections and don't hook up any actions to the route
# By specifying only: [], tells only hook up URLs for [] empty array.
    resources :sections, only: [] do 
      resources :lessons, only: [:new, :create]
      resources :photos, only: [:new, :create]
    end
    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:new, :create]
    end
  end
end
