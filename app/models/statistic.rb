class Statistic

  def initialize(opts)
    @year = opts[:year]
    @month = opts[:month]
    @day = opts[:day]
  end

  def calculate!
    @votes = LunchUserResponse.query(year: @year, month: @month, day: @day)
  end

  def average
    calculate_average(@votes)
  end

  def votes_count
    @votes.count
  end

  def votes_stats
    @votes
    stats = {}
    LunchUserResponse::VOTE_TO_LABEL.each do |key, value|
      stats[value] = @votes.select{|x| x.vote_index == key}.count
    end
    stats
  end

  private

  def calculate_average(votes)
    vote_rates = votes.map(&:vote_index)
    (vote_rates.sum / vote_rates.size.to_f).round(2)
  end
end