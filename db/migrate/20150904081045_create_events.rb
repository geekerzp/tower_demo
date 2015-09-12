class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :user, index: true
      t.belongs_to :team, index: true
      t.belongs_to :project, index: true
      t.string :type
      t.text :fields
      t.timestamps null: false
    end
  end
end
