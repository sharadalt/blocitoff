include RandomData

User.create!(
  name: 'user1',
  email: 'user1@example.com',
  password: 'hello123',
  role: 'admin'
)

User.create!(
  name: "user2",
  email: "user2@example.com",
  password: "hello123"
)

users = User.all

#Create Todos
10.times do
    Todo.create!(
        todo_item:  RandomData.random_sentence,
        time_duration: 7,
        user: users.sample
)
end
todos = Todo.all

puts "Seed finished"
puts "#{Todo.count} Todos created"
puts "#{User.count} Users created"
