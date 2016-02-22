class AddAfterQuestionToQuestion < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.boolean :after_only, default: false
    end
  end
end
