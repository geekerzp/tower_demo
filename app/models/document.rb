# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Document < ActiveRecord::Base
  has_many :comments, dependent: :destroy
end
