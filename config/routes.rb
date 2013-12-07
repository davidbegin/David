David::Application.routes.draw do
	resources :blogs
  get "main/index"
	get "/portfolio", to: 'main#portfolio', as: :portfolio
  devise_for :admins
	root to: 'blogs#index'
end
