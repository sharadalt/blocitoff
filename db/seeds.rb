include RandomData

#Create Todos
50.times do
    Todo.create!(
        todo_item:  RandomData.random_sentence
)
end
todos = Todo.all

puts "Seed finished"
puts "#{Todo.count} Todos created"