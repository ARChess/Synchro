Synchro::Application.routes.draw do
  match "/login" => 'session#user_login'
  match "/logout" => 'session#user_logout'
  match "/settings" => "settings#index"
  match "/update" => "settings#update"
  
  root :to => 'session#index'

  resources :game

  namespace :api do
    mount Api::GameApi, :at => "/"
  end
end
