# coding: utf-8
class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :members, :add_member, :remove_member]
  before_action :set_team, only: [:index, :new, :create]
  before_action :check_permission, only: [:show]

  def index
    @projects = @team.projects.all
  end

  def show
    @todos = @project.todos.unfinished
  end

  def new
    @project = @team.projects.build
  end

  def create
    @project = @team.projects.build(project_params)
    @project.members << current_user

    respond_to do |format|
      if @project.save
        format.html { redirect_to team_projects_path(@team), notice: '创建项目成功' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: '删除项目成功' }
    end
  end

  def members
    @members = @project.members
  end

  def add_member
    user = User.find(params[:user_id])
    respond_to do |format|
      if !@project.members.include?(user)
        @project.members << user
        format.js { flash[:notice] = '增加成员成功' }
      else
        format.js { flash[:error] = "用户已经增加" }
      end
    end
  end

  def remove_member
    user = User.find(params[:user_id])
    respond_to do |format|
      if @project.members.include?(user)
        @project.members.delete(user)
        format.html { redirect_to members_project_path(@project), notice: '删除成员成功' }
      else
        format.html { redirect_to members_project_path(@project), notice: '成员不存在' }
      end
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

  def project_params
    params[:project].permit(:name)
  end

  def check_permission
    unless @project.members.include?(current_user)
      flash[:error] = "用户没有权限"
      redirect_to request.referer
    end
  end
end
