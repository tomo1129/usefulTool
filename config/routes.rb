Rails.application.routes.draw do
  root :to => 'top#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resourcesがあればhttp://akkunchoi.github.io/rails3-routes.htmlにあるようなルートができる
  resources :ramdom
  resources :knowledge
end
