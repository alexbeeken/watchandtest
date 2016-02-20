class ResponsesController < ApplicationController

  before_filter :authenticate_user!

  def create
    Response.create(text: response_params[:text], question_id: response_params[:id], user_id: current_user.id)
    if Question.last.id != response_params[:id].to_i
      redirect_to "/question/#{response_params[:id].to_i+1}"
    else
      redirect_to "/thankyou"
    end
  end

  private

  def response_params
    params.permit(:id, :text)
  end

end
