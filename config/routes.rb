Rails.application.routes.draw do

get root 'gossips#index'
get 'about/welcome/:first_name', to: 'about#welcome'
get 'about/team'
get 'about/contact'
resources :gossips
resources :users
resources :cities

end

