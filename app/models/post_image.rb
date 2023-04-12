class PostImage < ApplicationRecord
  
  has_one_attached :image
  
  #1:NのN側のモデルにbelongs_toメソッドを記述
  belongs_to :user
  
  # 画像が投稿されていないときはエラーを表示する
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
end
