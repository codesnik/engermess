Engermess::Application.routes.draw do |map|

  resources :users do
    resources :chats, :only => [:new]
  end

  resources :chats, :except => [:edit, :update] do
    resources :messages, :only => [:create]
  end

  resource :auth, :only => [:create, :destroy]

  root :to => 'users#index'
end
