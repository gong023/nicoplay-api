Api::Application.routes.draw do
  match "/histories", :to => "histories#show", :via => :get
end
