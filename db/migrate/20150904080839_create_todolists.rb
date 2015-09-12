class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|

      t.timestamps null: false
    end
  end
end
