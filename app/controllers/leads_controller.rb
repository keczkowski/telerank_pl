class LeadsController < ApplicationController
  before_action :authenticate_user!
  before_action :has_access_to_leads

  def index
    @q = Call.ransack(params[:q])

    if params[:status] == "sukces" # czy są skonwertowane?
      @leads = @q.result(distinct: true).where("status LIKE ?", "%Sukces%").page params[:page] # te wyświetlamy w tabelce
    elsif params[:status] == "nie" # nie są skonwertowane
      @leads = @q.result(distinct: true).where.not("status LIKE ?", "%Sukces%").page params[:page] # te wyświetlamy w tabelce
    else  # czyli jak nie te wyżej to wszystkie
      @leads = @q.result(distinct: true).page params[:page] # te wyświetlamy w tabelce
    end

    # te tylko dla zbiorczego podsumowania ilości leadów na wykresie
    @leads_count = Call.count
    @converted_leads_count = Call.where("status LIKE ?", "%Sukces%").count
    @not_converted_leads_count = @leads_count - @converted_leads_count
  end


  def sales
    if params[:user_id] and User.exists?(params[:user_id])
      @user = User.find(params[:user_id])
    end
    if @user.present?
      @leads_count = @user.calls.count
      @converted_leads_count = @user.calls.where('status LIKE ?', "%Sukces%").count
      @leads = @user.calls
      @converted_leads = @user.calls.where('status LIKE ?', "%Sukces%")
      @not_converted_leads_count = @leads_count - @converted_leads_count
    else
      @leads_count = Call.count
      @converted_leads_count = Call.where('status LIKE ?', "%Sukces%").count
      @leads = Call.all
      @converted_leads = Call.where('status LIKE ?', "%Sukces%")
      @not_converted_leads_count = @leads_count - @converted_leads_count
    end
  end

  def financial
  end

end
