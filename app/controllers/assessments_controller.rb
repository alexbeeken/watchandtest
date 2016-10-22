class AssessmentsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :verify_teacher, only: [:create]
  before_filter :authorize_resource, except: [:create]

  def create
    assessment = Assessment.create(assessment_params)
    current_user.assessments << assessment
    current_user.save
    redirect_to nodata_path
  end

  def show
    @assessment = Assessment.find(params[:id])
    @questions = @assessment.questions
  end

  def new

  end

  private

  def assessment_params
    params.require(:assessment).permit(:name)
  end

  def authorize_resource
    current_user.admin ||
      (current_user.teacher &&
      Assessment.find(params[:id]).users.include?(current_user))
  end

  def verify_teacher
    current_user.admin || current_user.teacher
  end

end
