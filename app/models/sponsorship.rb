class Sponsorship < ActiveRecord::Base

  belongs_to :habit
  belongs_to :user

  validates :habit_id, presence: true
  validates :amount, presence: true
  validates :interval, presence: true

end
