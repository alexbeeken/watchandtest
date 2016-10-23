class CreateQuestionTables < ActiveRecord::Migration
  def change
    create_table :question_media do |t|
      t.belongs_to :question
      t.string :text
      t.string :type
    end

    create_table :question_response do |t|
      t.belongs_to :question
      t.string :text
      t.string :type
    end
  end
end
