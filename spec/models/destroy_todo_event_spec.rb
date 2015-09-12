require 'rails_helper'

RSpec.describe DestroyTodoEvent, type: :model do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:project) { create(:project, team: team) }

  describe "#create" do
    it "create DestroyTodoEvent when destroy todo" do
      expect(team.events.where(type: 'DestroyTodoEvent')).to eq([])
      todo = create(:todo, project: project, creator: user)
      todo.subscribe(EventNotifier.new)
      todo.destroy
      expect(team.events.where(type: 'DestroyTodoEvent').size).to eq(1)
    end
  end
end
