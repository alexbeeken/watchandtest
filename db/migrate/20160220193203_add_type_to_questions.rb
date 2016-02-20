class AddTypeToQuestions < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.string :response_type
    end
  end
end
