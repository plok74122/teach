Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events do
    resources :attendees, :controller => 'event_attendees'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # match ':controller(/:action(/:id(.:format)))', :via => :all
end
