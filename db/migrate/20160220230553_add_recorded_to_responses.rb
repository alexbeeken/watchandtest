class AddRecordedToResponses < ActiveRecord::Migration
  def change
    change_table :responses do |t|
      t.boolean :recorded, default: false
    end
  end
end
