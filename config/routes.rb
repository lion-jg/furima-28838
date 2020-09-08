Rails.application.routes.draw do
  get 'items/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: "items#index"

end
