class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # 新規登録とプロフィール編集で許可する項目
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :phone])
  end
end
