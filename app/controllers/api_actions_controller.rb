class ApiActionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def login # przyjmuje json { email: 'jakis email', password: 'jakies haslo' } zwraca {jwt: 'jakies jwt'}
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email)
    if user.valid_password?(password)
      jwt = JWT.encode({user_id: user.id}, Rails.application.credentials.secret_key_base, 'HS256')
      render json: { jwt: jwt }
    else
      render json: {error: 'not authenticated'}
    end
  end

  def add_lead # dodaje nowy lead dla wyslanych danych { jwt: 'jakies jwt', imie: 'jakies imie', ... } zwraca dodamu lead w json
    jwt = params[:jwt]
    decoded_token = JWT.decode(jwt, Rails.application.credentials.secret_key_base, 'HS256')
    if decoded_token
      lead = Client.new
      lead.imie = params[:imie] if params[:imie].present?
      lead.nazwisko = params[:nazwisko] if params[:nazwisko].present?
      lead.email = params[:email] if params[:email].present?
      lead.numer_telefonu = params[:numer_telefonu] if params[:numer_telefonu].present?
      lead.zainteresowanie_usluga = params[:zainteresowanie_usluga] if params[:zainteresowanie_usluga].present?
      lead.zrodlo = params[:zrodlo] if params[:zrodlo].present?
      lead.miasto = params[:miasto] if params[:miasto].present?
      lead.kod = params[:kod] if params[:kod].present?
      lead.adres = params[:adres] if params[:adres].present?
      if lead.save
        render json: { lead: lead }.as_json
      else
        render json: { error: 'Unable to save Lead.'}
      end
    else
      puts "ERROR with decoded token"
    end
  end

end
