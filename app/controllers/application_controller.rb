class ApplicationController < ActionController::Base
  # ログイン状態にないとき別の画面へアクセスしたら、ログイン画面へリダイレクト
  before_action :authenticate_user!, except: [:top]

  # ストロングパラメータの記述
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後にAboutページへ遷移するよう設定
   # def after_sign_in_path_for(resource)
    # about_path
  # サインイン後にindexページへ遷移するよう設定
   def after_sign_in_path_for(resource)
    post_images_path
   end

  # サインアウト後にAboutページへ遷移するよう設定
   def after_sign_out_path_for(resource)
    about_path
   end

   protected

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   end
end
