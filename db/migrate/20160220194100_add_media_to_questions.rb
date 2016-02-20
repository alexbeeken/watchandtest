class AddMediaToQuestions < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.string :media
      t.string :choices
    end
  end
end
