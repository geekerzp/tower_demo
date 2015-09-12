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

class Todo < ActiveRecord::Base
  include Wisper::Publisher

  has_many :comments, dependent: :destroy

  belongs_to :assignee, class_name: "User", foreign_key: "user_id"
  belongs_to :creator, class_name: "User", foreign_key: 'creator_id'
  belongs_to :project

  validates :name, presence: true

  after_create :publish_creation_successful
  after_destroy :publish_destruction_successful
  after_update :publish_finish_successful, if: :finished?
  after_update :publish_assignment_successful, if: :user_id_changed?
  after_update :publish_due_date_change_successful, if: :due_changed?

  scope :unfinished, -> { where(finished: false) }

  private

  def publish_creation_successful
    broadcast(:todo_creation_successful, self)
  end

  def publish_destruction_successful
    broadcast(:todo_destruction_successful, self)
  end

  def publish_finish_successful
    broadcast(:todo_finish_successful, self)
  end

  def publish_assignment_successful
    before_assignee_id, after_assignee_id = changes["user_id"]
    broadcast(:todo_assignment_successful, self, before_assignee_id, after_assignee_id)
  end

  def publish_due_date_change_successful
    before_due_date, after_due_date = changes["due"]
    broadcast(:todo_due_date_change_successful, self, before_due_date, after_due_date)
  end
end
