class QuestionsController < ApplicationController

  before_filter :authenticate_user!

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

end
