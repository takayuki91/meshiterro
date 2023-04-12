class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|

      # post_imagesテーブルに必要なカラムを追加
      t.string:shop_name
      t.text:caption
      t.integer:user_id
      
      t.timestamps
    end
  end
end
