class CallsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_call, only: [:show, :edit, :update, :destroy]
  before_action :has_access_to_calls

  # GET /calls
  # GET /calls.json
  def index
    @q = Call.ransack(params[:q])
    @calls = @q.result(distinct: true).page params[:page]
  end

  # GET /calls/1
  # GET /calls/1.json
  def show
    @client = @call.client
    @screenplay = @call.screenplay
  end

  # GET /calls/new
  def new
    @call = Call.new
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = Call.new(call_params)

    respond_to do |format|
      if @call.save
        format.html {
          url = Rails.application.routes.recognize_path(request.referrer)
          last_controller = url[:controller]
          if last_controller == "clients"
            redirect_to client_call_path(client_id: @call.client_id, call_id: @call.id)
          else
            redirect_to @call
          end
        }
        format.json { render :show, status: :created, location: @call }
      else
        format.html { render :new }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1
  # PATCH/PUT /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render :show, status: :ok, location: @call }
      else
        format.html { render :edit }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_params
      params.require(:call).permit(:user_id, :client_id, :screenplay_id, :status)
    end
end
