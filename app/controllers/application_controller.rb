class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path
    when User
      user_path(@user.user_name)
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin   # ログアウト時はシンボルが返ってくる
      new_admin_session_path
    when :user  # ログアウト時はシンボルが返ってくる
      user_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account_name, :user_name, :sex, :age])
  end
end
