class EventsController < ApplicationController
  before_action :set_team, only: [:index]

  def index
    @events = @team.events.after_time(Time.at(params[:after].to_i + 1))
  end

  private

  def set_team
    @team = Team.find(params[:team_id])
  end
end
