# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_projects_on_team_id  (team_id)
#

class Project < ActiveRecord::Base
  belongs_to :team

  has_many :accesses
  has_many :members, through: :accesses, source: :user

  has_many :todos, dependent: :destroy
  has_many :uploads, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :totolists, dependent: :destroy
  has_many :events, dependent: :destroy

  has_one :attachmentdir, dependent: :destroy

  validates :name, presence: true
end
