require 'rails_helper'

RSpec.describe AssignTodoEvent, type: :model do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:project) { create(:project, team: team) }

  describe "#create" do
    it "create AssignTodoEvent when assign todo" do
      expect(team.events.where(type: 'AssignTodoEvent')).to eq([])
      todo = create(:todo, project: project, creator: user)
      todo.subscribe(EventNotifier.new)
      todo.update(assignee: user)
      expect(team.events.where(type: 'AssignTodoEvent').size).to eq(1)
    end
  end
end
