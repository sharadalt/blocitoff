class AddStatusToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :finish_status, :boolean, default: false
  end
end
