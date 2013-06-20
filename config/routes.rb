RailsFullcalendarIcecube::Application.routes.draw do
  resources :calendars
  resources :events
  resources :event_instances

  match "/test" => "calendars#test", :as => :test
  root :to => 'calendars#index'
end
