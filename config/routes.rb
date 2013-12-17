Api::Application.routes.draw do
  resources :histories, only: [:index, :show], defaults: { format: :json }
end
