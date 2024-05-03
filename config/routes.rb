Rails.application.routes.draw do
  
  root to: 'homes#top'
  # get 'books/new','books'=>'books#index'
  # post  'books' => 'books#create'
  # get 'books'=>'books#index'
  # get 'books/:id' => 'books#show',as: 'book'
  # get 'books/edit'=>'books#edit'
  # get '/top' => 'homes#top'
  # get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
   resources :books
  # 上記のresourcesメソッドは、ルーティングを一括して自動生成してくれる機能、コメントアウト分全部
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
