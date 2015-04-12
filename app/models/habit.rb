class Habit < ActiveRecord::Base
  has_many :sponsorship
  belongs_to :user

  validates :title, presence: true
  validates :days, presence: true
end
