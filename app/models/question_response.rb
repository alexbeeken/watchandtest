class QuestionResponse < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :assessment, through: :question
end
