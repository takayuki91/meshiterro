class ApplicationController < ActionController::Base
  # ストロングパラメータの記述
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後にAboutページへ遷移するよう設定
   def after_sign_in_path_for(resource)
    about_path
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
