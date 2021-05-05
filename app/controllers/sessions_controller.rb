class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      Rails.logger.info "Auth Successful"
      log_in user
      redirect_to '/dashboard'
    else
      Rails.logger.info "Auth Failed"
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    Rails.logger.info "Deleting User session"
    log_out
    redirect_to root_url
  end
end