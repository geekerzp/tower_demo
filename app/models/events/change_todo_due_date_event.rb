# coding: utf-8
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

class ChangeTodoDueDateEvent < Event
  store_accessor :fields,
                 :todo_name,
                 :before_due_date,
                 :after_due_date

  def before_due_date
    super || "没有截止时间"
  end

  def after_due_date
    super || "没有截止时间"
  end
end
