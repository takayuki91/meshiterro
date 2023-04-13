Rails.application.routes.draw do
  
  devise_for :users
  root to:"homes#top"
  
  # 自動生成されたpost_imagesコントローラーのルーティングの記述を変更
  # resourcesメソッドを限定
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  
  # usersコントローラのアクションをresourcesメソッドで限定
  resources :users, only: [:show, :edit, :update]

  get 'homes/about' => 'homes#about', as: 'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
