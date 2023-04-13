class Favorite < ApplicationRecord
  
  # 関連づけ
  belongs_to :user
  belongs_to :post_image
  
end
