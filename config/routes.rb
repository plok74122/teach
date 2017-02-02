Rails.application.routes.draw do
  resources :events do
    resources :attendees, :controller => 'event_attendees'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # match ':controller(/:action(/:id(.:format)))', :via => :all
end
