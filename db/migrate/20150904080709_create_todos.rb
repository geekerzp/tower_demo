class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.date :due
      t.boolean :finished, default: false
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
      t.belongs_to :creator, index: true
      t.timestamps null: false
    end
  end
end
