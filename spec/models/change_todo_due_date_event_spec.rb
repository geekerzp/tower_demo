require 'rails_helper'

RSpec.describe ChangeTodoDueDateEvent, type: :model do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:project) { create(:project, team: team) }

  describe "#create" do
    it "create ChangeTodoDueDateEvent" do
      expect(team.events.where(type: 'ChangeTodoDueDateEvent')).to eq([])
      todo = create(:todo, project: project, creator: user)
      todo.subscribe(EventNotifier.new)
      todo.update(due: Date.today)
      expect(team.events.where(type: 'ChangeTodoDueDateEvent').size).to eq(1)
    end
  end
end
