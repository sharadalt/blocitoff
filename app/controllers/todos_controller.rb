class TodosController < ApplicationController
  
  def index
     @todos = Todo.all
  end
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  def new
    @todo = Todo.new
  end

  def create
     @todo = Todo.new
     @todo.todo_item = params[:todo][:todo_item]

     if @todo.save
       flash[:notice] = "Todo  was saved."
       redirect_to @todo
     else
       flash.now[:alert] = "There was an error saving the todo. Please try again."
       render :new
     end
  end
end
