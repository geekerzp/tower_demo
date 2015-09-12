require 'rails_helper'

RSpec.describe CreateCommentEvent, type: :model do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:project) { create(:project, team: team) }
  let(:todo) { create(:todo, project: project) }

  describe "#create" do
    it "create CreateCommentEvent" do
      expect(team.events.where(type: 'CreateCommentEvent')).to eq([])
      comment = build(:comment, todo: todo)
      comment.subscribe(EventNotifier.new)
      comment.save
      expect(team.events.where(type: 'CreateCommentEvent').size).to eq(1)
    end
  end
end
