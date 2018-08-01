class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  users_types = ['Administrator','Technicien','Professeur']

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Vous devez vous connecter."
        redirect_to login_url
      end
    end 
    def admin_user
      unless is_admin?
        flash[:danger] = "Vous n'êtes pas autorisé."
        redirect_to root_url
      end
    end

    def prof_user
      unless is_prof?
        flash[:danger] = "Vous n'êtes pas autorisé."
        redirect_to root_url
      end
    end

    def tech_user
      unless is_technician?
        flash[:danger] = "Vous n'êtes pas autorisé."
        redirect_to root_url
      end
    end


    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user || is_admin?
    end
end
