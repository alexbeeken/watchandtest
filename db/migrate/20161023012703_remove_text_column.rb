class RemoveTextColumn < ActiveRecord::Migration
  def change
    rename_column :questions, :text, :name
  end
end
