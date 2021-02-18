class ApplicationController < ActionController::Base

  def has_access_to_users
    unless current_user.present? and current_user.manage_users == true
      redirect_to root_path
    end
  end

  def has_access_to_agreements
    unless current_user.present? and current_user.manage_agreements == true
      redirect_to root_path
    end
  end

  def has_access_to_calls
    unless current_user.present? and current_user.manage_calls == true
      redirect_to root_path
    end
  end

  def has_access_to_clients
    unless current_user.present? and current_user.manage_clients == true
      redirect_to root_path
    end
  end

  def has_access_to_events
    unless current_user.present? and current_user.manage_events == true
      redirect_to root_path
    end
  end

  def has_access_to_partners
    unless current_user.present? and current_user.manage_partners == true
      redirect_to root_path
    end
  end

  def has_access_to_reminders
    unless current_user.present? and current_user.manage_reminders == true
      redirect_to root_path
    end
  end

  def has_access_to_screenplays
    unless current_user.present? and current_user.manage_screenplays == true
      redirect_to root_path
    end
  end

end
