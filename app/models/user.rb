class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 1:Nの1側のモデルにhas_manyメソッドを記述
  # Userモデル:PostImageモデル=1:N
  has_many :post_images, dependent: :destroy
  # Userモデル:PostCommentモデル=1:N
  has_many :post_comments, dependent: :destroy
  #関連づけ
  has_many :favorites, dependent: :destroy
  
  # プロフィール画像を扱うための追記　ActiveStrageを使う
  has_one_attached :profile_image
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
