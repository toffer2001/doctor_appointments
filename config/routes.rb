Rails.application.routes.draw do

root 'users#index'

resources :users do
  resources :appointments
end

resources :doctors

end
