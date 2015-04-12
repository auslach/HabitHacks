class AddStatusToHabits < ActiveRecord::Migration
  def change
    add_column :habits, :status, :boolean
  end
end
