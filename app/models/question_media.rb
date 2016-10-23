class QuestionMedia < ActiveRecord::Base

  belongs_to :question
  belongs_to :assessment, through: :question

end
