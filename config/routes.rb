Engermess::Application.routes.draw do |map|

  resources :users

  resources :chats, :except => [:edit, :update] do
    resources :messages, :only => [:create]
  end

  resource :auth, :only => [:create, :destroy]

  root :to => 'users#index'
end
