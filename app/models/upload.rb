# == Schema Information
#
# Table name: uploads
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Upload < ActiveRecord::Base
  has_many :comments, dependent: :destroy
end
