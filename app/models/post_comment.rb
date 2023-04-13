class PostComment < ApplicationRecord
  
  #1:NのN側のモデルにbelongs_toメソッドを記述
  belongs_to :user
  belongs_to :post_image
  
end
