Rails.application.routes.draw do
  resources :people

  resources :events do
    resources :attendees, :controller => 'event_attendees'
  end

  resources :events do
    collection do
      get :latest
      post :bulk_delete
      post :bulk_update
    end

    member do
      get :dashboard
    end

    member do
      post :join
      post :withdraw
    end
  end

  resources :events do
    resource :location, :controller => 'event_locations'
  end

  namespace :admin do
    resources :events
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "welcome/say_hello" => "welcome#say"
  get "welcome" => "welcome#index"

  root :to => "welcome#index"
end
