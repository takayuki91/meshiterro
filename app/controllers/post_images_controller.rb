class PostImagesController < ApplicationController

  # 画像投稿の画面を表示するためのnewアクションメソッド
  def new
    @post_image = PostImage.new
  end

  #投稿データを保存するためのcreateアクションメソッド
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  #投稿一覧で表示するすべての画像を取得するためのindexアクションメソッド
  def index
    @post_images = PostImage.all
  end

  # 詳細画面で表示する特定idを格納させるshowアクションメソッド
  def show
    @post_image = PostImage.find(params[:id])
    # コメントを投稿するためのインスタンス変数
    @post_comment = PostComment.new
  end

  # 投稿削除のdestroyアクションメソッド
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end

  #投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
