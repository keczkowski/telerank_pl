class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :up, :down]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  def up
    @screenplay = @question.screenplay
    @last = @screenplay.questions.where("sequence < #{@question.sequence}").order(:sequence).last
    if @last.present?
      a = @last.sequence
      @last.sequence = @question.sequence
      @last.save
      @question.sequence = a
      @question.save
      a = 1
      @screenplay.questions.order(:sequence).each do |question|
        question.sequence = a
        a += 1
        question.save
      end
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def down
    @screenplay = @question.screenplay
    @last = @screenplay.questions.where("sequence > #{@question.sequence}").order(sequence: :desc).last
    if @last.present?
      a = @last.sequence
      @last.sequence = @question.sequence
      @last.save
      @question.sequence = a
      @question.save
      a = 1
      @screenplay.questions.order(:sequence).each do |question|
        question.sequence = a
        a += 1
        question.save
      end
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:screenplay_id, :name, :body, :sequence)
    end
end
