class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user

      redirect_to :controller => 'main', :action => 'index'
    else
      flash[:danger] = 'Invalid username/password'
      render 'new'
    end
  end

  def destroy
  end
end