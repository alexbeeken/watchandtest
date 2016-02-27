class AddCorrectReponseToQuestion < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.string :correct_answer, default: "none"
    end
  end
end
