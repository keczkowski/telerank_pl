class AgreementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_agreement, only: [:show, :edit, :update, :destroy]
  before_action :has_access_to_agreements

  # GET /agreements
  # GET /agreements.json
  def index
    @q = Agreement.ransack(params[:q])
    @agreements = @q.result(distinct: true).page params[:page]
  end

  # GET /agreements/1
  # GET /agreements/1.json
  def show
  end

  # GET /agreements/new
  def new
    @agreement = Agreement.new
  end

  # GET /agreements/1/edit
  def edit
  end

  # POST /agreements
  # POST /agreements.json
  def create
    @agreement = Agreement.new(agreement_params)

    respond_to do |format|
      if @agreement.save
        format.html { redirect_back(fallback_location: root_path, notice: "Dodano umowę do bazy danych.") }
        format.json { render :show, status: :created, location: @agreement }
      else
        format.html { render :new }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agreements/1
  # PATCH/PUT /agreements/1.json
  def update
    respond_to do |format|
      if @agreement.update(agreement_params)
        format.html { redirect_back(fallback_location: root_path, notice: "Zmieniono umowę w bazie danych.") }
        format.json { render :show, status: :ok, location: @agreement }
      else
        format.html { render :edit }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agreements/1
  # DELETE /agreements/1.json
  def destroy
    @agreement.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path, notice: "Usunięto umowę z bazy danych.") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agreement
      @agreement = Agreement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agreement_params
      params.require(:agreement).permit(:name, :body, :user_id, :client_id, :partner_id, :call_id)
    end
end
