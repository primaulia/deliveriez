Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'orders#index'
  resources :orders,
            only: [:show, :index],
            param: :order_id

end
