class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.string :text
    end
  end
end
