class QuestionsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_if_finished

  def show
    @question = Question.find(question_params[:id])
    @question_count = get_question_count
    @question_number = get_question_number
  end

  def create
    previous_record = Response.where(user_id: current_user.id, question_id: question_params[:id], assessment_id: nil)
    if previous_record[0]
      previous_record[0].text = question_params[:text]
      previous_record[0].save
    else
      Response.create(text: question_params[:text], question_id: question_params[:id], user_id: current_user.id)
    end
    unless last_question
      redirect_to "/questions/#{question_params[:id].to_i+1}"
    else
      assessment = Assessment.save_assessment(current_user)
      if current_user.watched_video
        assessment.before = false
        assessment.save
        current_user.finished = true
        current_user.save
        redirect_to "/thankyou"
      else
        assessment.before = true
        assessment.save
        current_user.watched_video = true
        current_user.save
        redirect_to "/video"
      end
    end
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
    params.permit(:id, :text)
  end

  def check_if_finished
    if current_user.finished
      redirect_to "/thankyou"
    end
  end

end
