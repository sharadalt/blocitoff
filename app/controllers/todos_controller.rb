class TodosController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user
  
  def index 
    # 2. -> /users/:user_id/todos
    @user = User.find(params[:user_id])
    #@todos = @user.todos.where("days_left > 0")
    @todos = @user.todos
    @todo = Todo.new
  end
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  def new
    @user = User.find(params[:user_id])
    @todo = Todo.new
  end

  def create
    @todo = Todo.new
    @todo.todo_item = params[:todo][:todo_item]
    @todo.days_left = params[:todo][:days_left]
    @todo.user = current_user
    
    if @todo.save
      flash[:notice] = "Todo  was saved."
      redirect_to user_todos_path
    else
      flash.now[:alert] = "There was an error saving the todo. Please try again."
      render :new
    end
  end

  def edit
     @user = User.find(params[:user_id])
     @todo = Todo.find(params[:id])
  end
  
  def update
     @user = User.find(params[:user_id])
     @todo = Todo.find(params[:id])
     @todo.todo_item = params[:todo][:todo_item]
     @todo.days_left = params[:todo][:days_left]
     
 
     if @todo.save
       flash[:notice] = "Todo was updated."
       redirect_to user_todo_path(@user, @todo)
     else
       flash[:error] = "There was an error saving the todo. Please try again."
       render :edit
     end
  end
  
  def complete
    @todo = Todo.find(params[:todo_id])
    @todo.days_left = 0
    @todo.save
    redirect_to :back
  end
   
   def destroy
     @todo = Todo.find(params[:id])
 
     if @todo.destroy
       flash[:notice] = "\"#{@todo.todo_item}\" was deleted successfully."
       redirect_to user_todos_path
     else
       flash[:error] = "There was an error deleting the todo."
       render :show
     end
   end
   
   def authorize_user
     unless current_user || current_user.admin?
       flash[:alert] = "You must be an admin to do that."
       redirect_to @todo
     end
   end
end
