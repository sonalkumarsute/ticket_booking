Rails.application.routes.draw do
  root "movies#index"
  resources :venues
  resources :movies do
    member do
      post 'book_ticket'
    end
  end    
  get 'get_layout' => 'venues#get_layout', as: "get_layout", :defaults => { :format   => 'json' }
end
