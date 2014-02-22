module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    @current_user = user
  end

  def signed_in?
    current_user != nil
  end

  def signed_in_user
    unless signed_in?
      session[:return_to] = request.url

      redirect_to signin_path, notice: "please sign in"
    end
  end

  # signs out user by deleting @current_user and session cookie
  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
  end

  #getter and setter for @current_user (but is it necessary?)
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
end