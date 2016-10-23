class Assessment < ActiveRecord::Base

  has_many :responses
  has_many :questions
  has_and_belongs_to_many :users

  def self.save_assessment(current_user)
    assessment = Assessment.create(user_id: current_user.id)
    responses = current_user.responses.where(recorded: false)
    responses.map { |response| response.assessment_id = assessment.id; response.recorded = true; response.save}
    return assessment
  end

  def correct_percentage
    correct = 0
    self.responses.each do |response|
      if (response.question.correct_answer == response.text)
        correct += 1
      end
    end
    return (correct / Question.where(response_type: "select").count) * 100
  end

  def teachers
    users.where(teacher: true)
  end

end
