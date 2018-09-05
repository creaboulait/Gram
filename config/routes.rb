Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pics#index"

  resources :pics do
  	resources :comments, only: [:new, :create, :destroy]
  	member do
  		put "like", to: "pics#upvote"
  	end
  end

end
