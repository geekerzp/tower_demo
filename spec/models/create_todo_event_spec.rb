# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  project_id :integer
#  type       :string
#  fields     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_events_on_project_id  (project_id)
#  index_events_on_team_id     (team_id)
#  index_events_on_user_id     (user_id)
#

require 'rails_helper'

RSpec.describe CreateTodoEvent, type: :model do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:project) { create(:project, team: team) }

  before { user.teams << team }

  describe "#create" do
    it "create CreateTodoEvent when create todo" do
      expect(team.events.where(type: 'CreateTodoEvent')).to eq([])
      todo = build(:todo, project: project, creator: user)
      todo.subscribe(EventNotifier.new)
      todo.save
      expect(team.events.where(type: 'CreateTodoEvent').size).to eq(1)
    end
  end
end
