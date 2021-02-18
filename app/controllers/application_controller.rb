class ApplicationController < ActionController::Base

  def has_access_to_users
    unless current_user.present? and current_user.manage_users == true
      redirect_to root_path
    end
  end

end
