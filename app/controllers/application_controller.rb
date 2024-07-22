# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def resource_not_found(resource)
    return if resource

    render json: { success: false, message: 'The requested record does not exist.' }, status: :not_found
  end

  def authenticate_auth_user!(*)
    return if auth_admin_signed_in?

    respond_to do |format|
      flash[:alert] = 'you need to login'
      format.html { redirect_to new_auth_admin_session_path }
      format.js { render js: 'window.location.reload();' }
    end
  end

  def after_sign_in_path_for(_resource)
    admin_panel_plates_path
  end

  def after_sign_up_path_for(_resource)
    admin_panel_plates_path
  end

  def after_sign_out_path_for(_resource)
    admin_panel_plates_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name surname])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name surname])
  end
end
