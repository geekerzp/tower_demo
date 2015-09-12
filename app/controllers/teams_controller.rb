# coding: utf-8
class TeamsController < ApplicationController
  before_action :set_team, only: [:destroy, :members, :add_member, :remove_member]
  before_action :set_user, only: [:create, :add_member, :remove_member]

  def index
    @teams = current_user.teams

    render layout: 'launchpad'
  end

  def create
    @team = current_user.teams.create(team_params)

    respond_to do |format|
      if @team.errors.any?
        format.js { flash[:notice] = '创建团队成功' }
      else
        format.js
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
    end
  end

  def members
    @members = @team.members
  end

  def add_member
    respond_to do |format|
      if !@team.members.include?(@user)
        @team.members << @user
        format.js { flash[:notice] = "增加成员成功" }
      else
        format.js { flash[:error] = "用户已经增加" }
      end
    end
  end

  def remove_member
    respond_to do |format|
      if @team.members.include?(@user)
        @team.members.delete(@user)
        @team.projects.each { |project| project.members.delete(@user) }
        format.html { redirect_to members_team_path(@team), notice: '删除成员成功' }
      else
        format.html { redirect_to members_team_path(@team), error: '成员不存在' }
      end
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def team_params
    params[:team].permit(:name)
  end
end
