class LunchController < ApplicationController

  def show
  end

  def feedback
    time = Time.now
    LunchUserResponse.create(year: time.year,
       month: time.month, day: time.day,
       vote: params[:vote], user_name: params[:user_name], comment: params[:comment])
    redirect_to action: 'thanks_for_response'#, :params => { revision_name: rn, name: flow}
  end

  def thanks_for_response
  end

  def votes_list
    @votes = LunchUserResponse.all
  end
end
