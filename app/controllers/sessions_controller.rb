class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      #login and do stuff
      log_in user
      redirect_to user
    else
      #ERROR ERROR ABORT
      flash.now[:danger] = 'Invaild email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
