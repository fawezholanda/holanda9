class AlterLessonsAddUserIdColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :user_id, :integer
    add_index :lessons, :user_id
  end
end
