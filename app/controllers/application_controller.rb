class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :inst_types

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  def ensure_that_signed_in
    redirect_to signin_path, notice:'In order to perform this action, you need to be signed in' if current_user.nil?
  end

  def ensure_that_is_admin
    redirect_to instruments_path, notice:'Only admins can use this action' if (current_user.nil? or current_user.admin? == false)
  end

  def inst_types
    Rails.cache.fetch("types", expires_in: 5.minutes) {Type.all}
  end
end
