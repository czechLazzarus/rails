
#Session Controller
class SessionsController < ApplicationController
  skip_before_action :require_login
  layout 'login'

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to controller: 'main', action: 'index'
    else
      flash[:danger] = 'Invalid username/password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

end
