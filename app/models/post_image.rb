class PostImage < ApplicationRecord

  has_one_attached :image

  #1:NのN側のモデルにbelongs_toメソッドを記述
  belongs_to :user

  # 1:Nの1側のモデルにhas_manyメソッドを記述
  # PostImageモデル:PostCommentモデル=1:N
  has_many :post_comments, dependent: :destroy

  # 関連づけ
  has_many :favorites, dependent: :destroy

  # バリデーション
  validates :shop_name, presence: true
  validates :image, presence: true

  # 画像が投稿されていないときはエラーを表示する
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  # favorited_by?メソッド
  # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


end
