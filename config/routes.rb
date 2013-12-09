Api::Application.routes.draw do
  resources :histories, only: [:index, :show]
end
