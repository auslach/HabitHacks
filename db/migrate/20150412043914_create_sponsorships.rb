class CreateSponsorships < ActiveRecord::Migration
  def change
    create_table :sponsorships do |t|
      t.integer :habit_id
      t.integer :amount
      t.integer :interval

      t.timestamps null: false
    end
  end
end
