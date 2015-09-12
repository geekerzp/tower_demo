# == Schema Information
#
# Table name: todolists
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Todolist < ActiveRecord::Base
  has_many :todos, dependent: :destroy
  has_many :comments, dependent: :destroy
end
