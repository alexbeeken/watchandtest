class QuestionsController < ApplicationController

  before_filter :authenticate_user!

  def show
    @assessment = Assessment.find(params[:assessment_id])
    @question = Question.find(params[:id])
  end

  def index
    @assessment = Assessment.find(params[:assessment_id])
    redirect_to assessment_path(@assessment.id)
  end

  def create
    assessment = Assessment.find(params[:assessment_id])
    question = assessment.questions.create(question_params[:question])
    question.question_media.create(question_params[:question_media])
    redirect_to assessment_questions_path(assessment_id: assessment.id)
  end

  def new
    @assessment = Assessment.find(params[:assessment_id])
  end

  def edit
    @question = Question.find(params[:id])
    @assessment = Assessment.find(params[:assessment_id])
    @question_medium = @question.question_media.last
    unless @question_medium
      @question_medium = @question.question_media.create(type: "QuestionText")
    end
  end

  def update
    assessment = Assessment.find(params[:assessment_id])
    question = Question.find(params[:id])
    question.update(question_params[:question])
    question_medium = question.question_media.last
    question_medium.update!(question_params[:question_media])
    redirect_to assessment_questions_path(assessment_id: assessment.id)
  end

  private

  def question_params
    params.permit(
      :id,
      question_media: [:text, :type, :order_id],
      question: [:name]
    )
  end
end
