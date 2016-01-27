class AddTimeDurationToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :time_duration, :integer
  end
end
