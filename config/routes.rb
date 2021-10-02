Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books
  #Rootの場合Topページへ行くようにルーティング
  root :to => 'homes#top'
end