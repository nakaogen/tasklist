class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
  @task = Task.find(params[:id])

  if @task.update(task_params)
    flash[:success] = 'タスクが編集されました'
    redirect_to @task
  else
    flash.now[:danger] = 'タスクが編集されませんでした'
    render :new
  end
  end

  def destroy
  @task = Task.find(params[:id])
  @task.destroy

  flash[:success] = 'タスクが削除されました'
  redirect_to tasks_path
  end

  def create
  @task=Task.new(task_params)
  
  if @task.save
    flash[:success] = 'タスクが投稿されました'
    redirect_to @task
  else
    flash[:danger] = 'タスクが投稿されませんでした'
    render :new
  end
  end

  def task_params
  params.require(:task).permit(:content,:status)
  end
end