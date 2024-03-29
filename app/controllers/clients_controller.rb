class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :has_access_to_clients

  # GET /clients
  # GET /clients.json
  def index
    @q = Client.ransack(params[:q])
    @clients = @q.result(distinct: true).page params[:page]
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @call = Call.new
    @reminder = Reminder.new
    @agreement = Agreement.new
  end

  def call
    @call = Call.find(params[:call_id])
    @client = @call.client
    @screenplay = @call.screenplay
    @reminder = Reminder.new
    @agreement = Agreement.new
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    @client.user_id = current_user.id

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Lead został dodany do bazy.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    @client.user_id = current_user.id
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Lead zostal zaktualizowany.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Lead został usunięty.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:imie, :nazwisko, :numer_telefonu, :email, :miasto, :kod, :adres, :user_id, :zainteresowanie_usluga, :zrodlo)
    end
end
