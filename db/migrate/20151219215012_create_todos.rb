class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :todo_item
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :todos, [:user_id, :created_at]
  end
end
