class QuestionsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_if_finished

  def show
    @question = Question.find(question_params[:id])
    @question_count = get_question_count
    @question_number = get_question_number
  end

  def index
    @assessment = Assessment.find(params[:assessment_id])
    redirect_to assessment_path(@assessment.id)
  end

  def create
    assessment = Assessment.find(params[:assessment_id])
    assessment.questions.create(question_params[:question])
    redirect_to assessment_questions_path(assessment_id: assessment.id)
  end

  def new
    @assessment = Assessment.find(params[:assessment_id])
  end

  private

  def get_question_count
    if current_user.watched_video
      Question.count
    else
      Question.count - Question.where(after_only: true).count
    end
  end

  def get_question_number
    @question.id - Question.first.id + 1
  end

  def last_question
    # returns false if this is an after question when the user hasn't seen the video
    # returns false if this is the last question in general
    return true if Question.last.id == question_params[:id].to_i
    return ((Question.find(question_params[:id].to_i + 1).after_only && (current_user.watched_video == false)))
  end

  def question_params
    params.permit(:id, question: [:text])
  end

  def check_if_finished
    if current_user.finished
      redirect_to "/thankyou"
    end
  end

end
