class CreateCalenderEvents < ActiveRecord::Migration
  def change
    create_table :calender_events do |t|

      t.timestamps null: false
    end
  end
end
