module SessionsHelper
	# Logs in the given user.

  def log_in(user)
    session[:user_id] = user.id
  end

  # Remembers a user in a persistent session.
  def remember(user)
    #user.remember
    cookies.permanent.signed[:user_id] = user.id
    
    # <% cookies.permanent[:remember_token] = user.remember_token %>

  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def is_admin?
    !current_user.nil? &&  current_user.utype == 'Administrateur'
  end

  def is_technician?
    !current_user.nil? &&  current_user.utype == 'Technicien'
  end

def is_prof?
    !current_user.nil? &&  current_user.utype == 'Professeur'
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user?(user)
    user == current_user
  end
end
