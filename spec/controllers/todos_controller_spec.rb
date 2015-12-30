require 'rails_helper'
include RandomData

RSpec.describe TodosController, type: :controller do
  
  let(:my_todo) { Todo.create!(todo_item: RandomData.random_sentence)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns [my_todo] to @todos" do
      get:index
      expect(assigns(:todos)).to eq([my_todo])
    end
  end

  #describe "GET #show" do
   # it "returns http success" do
    #  get :show
     # expect(response).to have_http_status(:success)
  #  end
  #end
  
   describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
 
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
 
      it "instantiates @todo" do
        get :new
        expect(assigns(:todo)).not_to be_nil
      end
    end

  describe "Todo create" do
    
      it "increases the number of Todo by 1" do
        expect{ post :create, todo: { todo_item: RandomData.random_sentence } }.to change(Todo,:count).by(1)
      end
 
      it "assigns the new todo to @todo" do
        post :create, todo: {todo_item: RandomData.random_sentence}
        expect(assigns(:todo)).to eq Todo.last
      end
 
      it "redirects to the new todo" do
        post :create, todo: {todo_item: RandomData.random_sentence}
        expect(response).to redirect_to Todo.last
      end
      
    end  
end
