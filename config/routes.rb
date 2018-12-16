Rails.application.routes.draw do

  root 'blog#index'

  resources :blog, only: [:new, :show, :destroy] do
    collection do
      post 'create'
    end
    resources :entry do
      post '/comment/create', to: 'comment#create'
      post '/comment/:id/toggle_status', to: 'comment#toggle_status'
      delete '/comment/:id/destroy', to: 'comment#destroy'
    end
  end

end
