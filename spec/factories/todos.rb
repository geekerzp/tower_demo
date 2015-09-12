# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  name       :string
#  due        :date
#  finished   :boolean          default(FALSE)
#  project_id :integer
#  user_id    :integer
#  creator_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_todos_on_creator_id  (creator_id)
#  index_todos_on_project_id  (project_id)
#  index_todos_on_user_id     (user_id)
#

FactoryGirl.define do
  factory :todo do
    name 'fake_todo'
  end
end
