class StatisticsController < ApplicationController

  def show
    year = params[:year]
    month = params[:month]
    day = params[:day]

    @statistic = Statistic.new
  end
end
