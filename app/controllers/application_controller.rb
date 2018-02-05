# Application Controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  include SessionsHelper

  private

  def require_login
    redirect_to login_url unless current_user
  end
end
