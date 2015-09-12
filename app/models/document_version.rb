# == Schema Information
#
# Table name: document_versions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DocumentVersion < ActiveRecord::Base
end
