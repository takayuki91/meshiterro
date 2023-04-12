Rails.application.routes.draw do
  
  devise_for :users
  root to:"homes#top"
  
  # 自動生成されたpost_imagesコントローラーのルーティングの記述を変更
  # resourcesメソッドをnew,index,showのみに限定
  resources :post_images, only: [:new, :index, :show]

  get 'homes/about' => 'homes#about', as: 'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
