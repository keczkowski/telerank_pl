# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :manage, Reminder, user_id: user.id
      if user.manage_reminders
        can :manage, Reminder
      end
    end
  end
end
