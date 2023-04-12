class PostImagesController < ApplicationController
  
  # 画像投稿の画面を表示するためのnewアクションメソッド
  def new
    @post_image = PostImage.new
  end

  #投稿データを保存するためにcreateアクションメソッド
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end
  
  def index
  end

  def show
  end
  
  #投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
