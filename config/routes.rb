Rails.application.routes.draw do
  get 'register.json'

  get '/:id'

  get '/:id/stats'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
