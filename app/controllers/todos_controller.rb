class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :destroy]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to root_path
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :memo).merge(user_id: current_user.id)
  end

  def set_todo
    @todo = Todo.find_by(id: params[:id])
  end
end
