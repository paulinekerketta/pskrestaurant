Rails.application.routes.draw do
  get 'logs/index'

  get 'sales/index'

  get 'drivers/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: "indices#home"

get  'drivers',      to: 'drivers#index', as: 'drivers'
 get  'drivers/new',  to: 'drivers#new',   as: 'new_driver'
 get 'drivers/:id', to: 'drivers#show', as: 'driver'
post 'drivers',      to:'drivers#create'
get 'drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'
patch 'drivers/:id', to: 'drivers#update'

get  'sales',      to: 'sales#index', as: 'sales'
 get  'sales/new',  to: 'sales#new',   as: 'new_sale'
 get 'sales/:id', to: 'sales#show', as: 'sale'
post 'sales',      to:'sales#create'
get 'sales/:id/edit', to: 'sales#edit', as: 'edit_sale'
patch 'sales/:id', to: 'sales#update'

get  'logs',      to: 'logs#index', as: 'logs'
 get  'logs/new',  to: 'logs#new',   as: 'new_log'
 get 'logs/:id', to: 'logs#show', as: 'log'
post 'logs',      to:'logs#create'
get 'logs/:id/edit', to: 'logs#edit', as: 'edit_log'
patch 'logs/:id', to: 'logs#update'

end
