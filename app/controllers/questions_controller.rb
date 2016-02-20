class QuestionsController < ApplicationController

  before_filter :authenticate_user!

  def show
    @question = Question.find(question_params[:id])
  end

  private

  def question_params
    params.permit(:id)
  end

end
