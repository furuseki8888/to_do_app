class TodosController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @todos = current_user.todos
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
    params.require(:todo).permit(:title, :expired_at, :memo).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    @todo = Todo.find_by(id: params[:id])
    if @todo.user_id != current_user.id
      redirect_to root_path, notice: '権限がありません'
    end
  end
end
