class AddStatusToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :finish_status, :integer
  end
end
