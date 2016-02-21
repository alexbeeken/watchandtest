class QuestionsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_if_finished

  def show
    @question = Question.find(question_params[:id])
  end

  def create
    Response.create(text: question_params[:text], question_id: question_params[:id], user_id: current_user.id)
    if Question.last.id != question_params[:id].to_i
      redirect_to "/questions/#{question_params[:id].to_i+1}"
    else
      Assessment.save_assessment(current_user)
      if current_user.watched_video
        current_user.finished = true
        current_user.save
        redirect_to "/thankyou"
      else
        current_user.watched_video = true
        current_user.save
        redirect_to "/video"
      end
    end
  end

  private

  def question_params
    params.permit(:id, :text)
  end

  def check_if_finished
    if current_user.finished
      redirect_to "/thankyou"
    end
  end

end
