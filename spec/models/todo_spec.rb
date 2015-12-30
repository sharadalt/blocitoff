require 'rails_helper'

RSpec.describe Todo, type: :model do
  let(:todo) { Todo.create!(todo_item: "clean kitchen closet") }
 
   describe "attributes" do
     it "should respond to todo_item" do
       expect(todo).to respond_to(:todo_item)
     end
   end
end
