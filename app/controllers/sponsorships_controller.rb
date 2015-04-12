class SponsorshipsController < ApplicationController

  def create
    @sponsorship = current_user.sponsorships.create(sponsorship_params)
    redirect_to profile_path
  end

private
def sponsorship_params
  params.require(:sponsorship).permit(:habit_id, :amount, :interval)
end

end
