class AddUserToHabitsAndSponsorships < ActiveRecord::Migration
  def change
    add_column :habits, :user_id, :integer
    add_column :sponsorships, :user_id, :integer
  end
end
