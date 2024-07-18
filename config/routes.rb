Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  # root "hello#index"
  root 'static_pages#home'
end
