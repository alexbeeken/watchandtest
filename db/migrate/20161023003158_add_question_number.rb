class AddQuestionNumber < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.integer :order_id
    end
  end
end
