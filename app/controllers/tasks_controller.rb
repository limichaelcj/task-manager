class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    save_check(@task)
  end

  def edit
  end

  def update
    @task.update(task_params)
    save_check(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def save_check(task)
    if task.save
      redirect_to task_path(task)
    else
      @alert = 'Task needs a title'
      render new_path
    end
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
