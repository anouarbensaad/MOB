class SessionsController < ApplicationController
	include SessionsHelper

  def new
  end

  def create
    user = User.find_by("LOWER(login) = ?", user_params[:login].downcase)

    if  user && user.authenticate(user_params[:password])
      log_in user
      remember user
      redirect_to root_url
    else
      flash.now[:danger] = 'Login ou mot de passe invalide !'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def user_params
    params.require(:session).permit(:login, :password)
  end
end
