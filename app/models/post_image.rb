class PostImage < ApplicationRecord
  
  has_one_attached :image
  
  #1:NのN側のモデルにbelongs_toメソッドを記述
  belongs_to :user
  
end
