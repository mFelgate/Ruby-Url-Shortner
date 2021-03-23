Rails.application.routes.draw do
  resources :urls do
    collection do
      post 'shortUrl'
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end