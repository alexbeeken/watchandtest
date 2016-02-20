class Assessment < ActiveRecord::Base

  has_many :responses
  belongs_to :user

  def self.save_assessment(current_user)
    assessment = Assessment.create(user_id: current_user.id)
    responses = current_user.responses.where(recorded: false)
    responses.map { |response| response.assessment_id = assessment.id}
  end

end
