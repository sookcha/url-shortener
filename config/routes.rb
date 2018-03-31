Rails.application.routes.draw do
  get 'stats/index'

  post 'register.json', to: "links#create"

  get '/:id', to: "links#show"

  get '/:id/stats', to: "stats#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
