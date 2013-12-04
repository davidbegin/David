David::Application.routes.draw do
	resources :blogs
  get "main/index"
  devise_for :admins
	root to: 'main#index'
end
