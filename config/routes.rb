David::Application.routes.draw do
	resources :blogs
  get "main/index"
	get "/portfolio", to: 'main#portfolio', as: :portfolio
	get "/about", to: 'main#about', as: :about
  devise_for :admins
	root to: 'blogs#index'
end
