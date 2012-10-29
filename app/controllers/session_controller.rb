class SessionController < ApplicationController
  def index
    if current_user
      redirect_to "/game"
    end
  end

  def user_login
    user = login(params["username"], params["password"])
    if user
      flash[:notice] = "Log In Successful"
      redirect_back_or_to "/game"
    else
      flash[:error] = "Login Incorrect"
      redirect_to "/"
    end
  end

  def user_logout
    logout
    flash[:notice] = "Logged Out"
    redirect_to "/"
  end
end
