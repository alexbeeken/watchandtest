class Question < ActiveRecord::Base

  has_many :question_responses
  has_many :question_media
  belongs_to :assessment
  after_create :assign_order_id

  def assign_order_id
    update!(order_id: assessment.questions.count)
  end
end
