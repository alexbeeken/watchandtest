class RemoveTextColumn < ActiveRecord::Migration
  def change
    def up
      remove_column :questions, :text
    end

    def down
      add_column :questions, :text, :string
    end
  end
end
