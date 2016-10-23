class AddOrderToQuestionMedia < ActiveRecord::Migration
  def change
    change_table :question_media do |t|
      t.integer :order_id
    end
  end
end
