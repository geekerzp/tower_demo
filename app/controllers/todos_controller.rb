# coding: utf-8
class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :finish]
  before_action :set_project, only: [:index, :create, :destroy, :finish, :update, :show]

  def index
    @todos = @project.todos.unfinished.all
  end

  def show
  end

  def create
    @todo = @project.todos.build(todo_params)
    @todo.creator = current_user

    @todo.subscribe(EventNotifier.new)

    respond_to do |format|
      if @todo.save
        format.js { flash[:notice] = '创建任务成功' }
      else
        format.js
      end
    end
  end

  def update
    @todo.subscribe(EventNotifier.new)

    if todo_params[:assignee].present?
      assignee = User.find(todo_params.delete(:assignee))
    else
      assignee = nil
    end

    respond_to do |format|
      if @todo.update(todo_params.merge(assignee: assignee))
        format.js { flash[:notice] = '更新任务成功' }
      else
        format.js
      end
    end
  end

  def destroy
    @todo.subscribe(EventNotifier.new)
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to project_todos_path(@project), notice: '删除任务成功' }
    end
  end

  def finish
    @todo.subscribe(EventNotifier.new)

    respond_to do |format|
      if @todo.update(finished: params[:finished])
        format.js { flash[:notice] = "成功完成任务'#{@todo.name}'" }
      else
        format.js
      end
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def todo_params
    params[:todo].permit(:name, :due, :assignee)
  end
end
