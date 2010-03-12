Engermess::Application.routes.draw do |map|

  resources :users

  resources :chats do
    resources :messages, :only => [:new, :create]
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  root :to => 'users#index'
end
