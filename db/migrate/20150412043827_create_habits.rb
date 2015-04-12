class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :title
      t.integer :days
      t.timestamps null: false
    end
  end
end
