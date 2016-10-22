class ChangeQuestionToHaveAssessmentId < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.belongs_to :assessment, null: false
    end
  end
end
