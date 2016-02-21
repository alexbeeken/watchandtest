class AddFinishedToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :finished, default: false
    end
  end
end
