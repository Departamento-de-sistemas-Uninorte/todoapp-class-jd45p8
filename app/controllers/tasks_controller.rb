class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  # GET with blank form
  def new
    @task = Task.new
  end

  # POST to save task on DB
  def create
    @task = Task.new(task_params)

    if @task.save
      # TODO add flash message with success
      redirect_to tasks_path
    else
      # TODO add flash message with errors
      render new_task_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      # TODO add flash message with success
      redirect_to tasks_path
    else
      # TODO add flash message with errors
      render new_task_path
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
