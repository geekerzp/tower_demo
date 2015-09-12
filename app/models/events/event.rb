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

class Event < ActiveRecord::Base
  store :fields, coder: JSON

  belongs_to :user
  belongs_to :team
  belongs_to :project

  scope :after_time, ->(time) { where('created_at > ?', time) }

end
