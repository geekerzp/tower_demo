class CreateStarItems < ActiveRecord::Migration
  def change
    create_table :star_items do |t|

      t.timestamps null: false
    end
  end
end
