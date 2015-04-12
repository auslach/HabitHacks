class PagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
    @habits = Habit.all.order('created_at DESC')
    @sponsorship = Sponsorship.new
  end

  def profile
    @habit = Habit.new
    @user = current_user
    @habits = current_user.habits.order('created_at DESC')
    @sponsorships = current_user.sponsorships.order('created_at DESC')
  end

end
