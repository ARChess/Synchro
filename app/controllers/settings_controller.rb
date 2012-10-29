class SettingsController < ApplicationController
  before_filter :require_login

  def index
    #no-op
  end

  def update
    user = login(current_user.username, params["current_password"])
    if user
      if params["new_password"] != params["confirm_password"]
        flash[:error] = "New Passwords do not Match"
      else
        current_user.password = params["new_password"]
        current_user.save!
        flash[:notice] = "Password Changed Successfully"
      end
    else
      flash[:error] = "Current Password Incorrect"
    end
    redirect_to "/settings"
  end
end
