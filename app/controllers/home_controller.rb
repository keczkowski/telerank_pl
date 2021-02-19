class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @clients_count = Client.count
    @partners_count = Partner.count
    @screenplays_count = Screenplay.count
    @agreements_count = Agreement.count
    @calls_count = Call.count
    @reminders_count = Reminder.count
    @events_count = Event.count
    @users_count = User.count
  end


end
