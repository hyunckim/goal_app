class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.date :goal_date

      t.timestamps null: false
    end
  end
end
