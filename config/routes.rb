Rails.application.routes.draw do

  get 'cities/index'
  get 'cities/show'
  get 'cities/edit'
  get 'cities/update'
  get 'cities/destroy'
  get 'cities/new'
get root 'gossips#index'
get 'about/welcome/:first_name', to: 'about#welcome'
get 'about/team'
get 'about/contact'
resources :gossips
resources :users
resources :cities

end

