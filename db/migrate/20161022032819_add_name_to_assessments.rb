class AddNameToAssessments < ActiveRecord::Migration
  def change
    change_table :assessments do |t|
      t.string :name
    end
  end
end
