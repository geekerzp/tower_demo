# == Schema Information
#
# Table name: calender_events
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CalenderEvent < ActiveRecord::Base
  has_many :comments, dependent: :destroy
end
