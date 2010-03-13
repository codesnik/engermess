Engermess::Application.routes.draw do |map|

  resources :users

  resources :chats do
    resources :messages, :only => [:new, :create]
  end

  resource :auth, :only => [:create, :destroy]

  root :to => 'users#index'
end
