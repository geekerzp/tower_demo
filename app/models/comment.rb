# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  todo_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_todo_id  (todo_id)
#  index_comments_on_user_id  (user_id)
#

class Comment < ActiveRecord::Base
  include Wisper::Publisher

  belongs_to :user
  belongs_to :todo

  after_create :publish_creation_successful

  validates :content, presence: true

  private

  def publish_creation_successful
    broadcast(:comment_creation_successful, self)
  end
end
