class CreateDocumentVersions < ActiveRecord::Migration
  def change
    create_table :document_versions do |t|

      t.timestamps null: false
    end
  end
end
