class AddTeacherFlag < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :teacher, default: false
    end
  end
end
