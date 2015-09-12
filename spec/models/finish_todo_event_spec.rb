require 'rails_helper'

RSpec.describe FinishTodoEvent, type: :model do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:project) { create(:project, team: team) }

  describe "#create" do
    it "create FinishTodoEvent when finish todo" do
      expect(team.events.where(type: 'FinishTodoEvent')).to eq([])
      todo = create(:todo, project: project, creator: user)
      todo.subscribe(EventNotifier.new)
      todo.update(finished: true)
      expect(team.events.where(type: 'FinishTodoEvent').size).to eq(1)
    end
  end
end
