Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders,
            only: [:show, :index],
            param: :order_id

  get '/orders/:order_id/feedbacks', to: 'feedbacks#index'
  post '/orders/:order_id/feedbacks', to: 'feedbacks#create'

end
