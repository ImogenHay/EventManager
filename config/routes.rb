Rails.application.routes.draw do
  devise_for :users #resources for models
  resources :tickets
  resources :reviews
  resources :events
  resources :locations
  root 'home#home' #sets home page/root to home/home
  get 'contact', to: 'home#contact' #root/contact url will bring to contact page (home controller, contact method)
  post 'request_contact', to: 'home#request_contact' #so submit button (contact us) will do request_contact action
  get 'about', to: 'home#about'  #root/about url will bring to about page (home controller, about method)
  get 'resources', to: 'resources#resources'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
