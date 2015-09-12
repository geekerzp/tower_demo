# == Schema Information
#
# Table name: accesses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_accesses_on_project_id  (project_id)
#  index_accesses_on_user_id     (user_id)
#

class Access < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :user_id, uniqueness: { scope: :project_id }
end
