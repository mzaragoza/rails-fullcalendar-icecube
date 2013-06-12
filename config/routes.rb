RailsFullcalendarIcecube::Application.routes.draw do
  resources :calendars
  resources :events
  resources :event_instances

  root :to => 'calendars#index'
end
