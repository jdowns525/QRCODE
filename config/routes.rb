Rails.application.routes.draw do
  resources :qr_codes, only: [:new, :create, :show, :index]
  root to: 'qr_codes#new'
end
