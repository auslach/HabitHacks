class HabitsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @habit = current_user.habits.create(habit_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

private
def habit_params
  params.require(:habit).permit(:title, :days)
end

end
