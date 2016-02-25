class AddRelationshipsToAssessment < ActiveRecord::Migration
  def change
    change_table :responses do |t|
      t.belongs_to :assessment
    end

    create_table :assessments do |t|
      t.belongs_to :user
      t.boolean :before
    end

    change_table :users do |t|
      t.boolean :watched_video, default: false
    end
  end
end
