namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    Todo.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end

#run the task at the terminal executing, rake todo:delete_items