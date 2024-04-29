Rails.application.routes.draw do
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'=>'books#edit'
  get '/top' => 'homes#top'
  resources :books
  # resourcesメソッドは、ルーティングを一括して自動生成してくれる機能
  
  # top画面は/だけで表示されるようにすること
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
