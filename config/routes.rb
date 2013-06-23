Api::Application.routes.draw do
    match "/api/menus", :to => "api/menus#search", :via => :get
end
