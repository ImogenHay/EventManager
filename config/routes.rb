Rails.application.routes.draw do
  root 'home#home' #sets home page/root ro home/home
  get 'contact', to: 'home#contact' #root/contact will bring to contact page
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
