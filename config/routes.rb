Api::Application.routes.draw do
#  resources :histories, only: [:show]
  get "histories/index"
  get "histories/show"
#  match "histories", controller: :histories, action: :show, via: :get
#  get "/histories" => "histories#show"
end
