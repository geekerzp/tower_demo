class CreateAttachmentdirs < ActiveRecord::Migration
  def change
    create_table :attachmentdirs do |t|

      t.timestamps null: false
    end
  end
end
