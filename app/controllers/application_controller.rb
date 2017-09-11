class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # このメソッドを先に実行しておく
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 配列を代入
  PERMISSIBLE_ATTRIBUTES = %i(name avatar avatar_cache)

  before_action :current_notifications, if: :signed_in?

  protected

  # Devise 専用のストロングパラメータ
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
    devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
  end

  def current_notifications
    @notifications_count = Notification.where(user_id: current_user.id).where(read: false).count
  end

end
