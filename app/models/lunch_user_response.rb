class LunchUserResponse < Fire::Model

  has_path_keys(:year, :month, :day)

  VOTE_TO_LABEL = {
      0 => 'Worst',
      1 =>  'Bad',
      2 => 'So so',
      3 => 'Not bad',
      4 => 'Good',
      5 => 'Best'
  }

  def vote_index
    self.vote.to_f
  end

  def vote_label
    self.class.vote_label(vote_index)
  end

  def self.vote_label(vote)
    VOTE_TO_LABEL[vote.round]
  end
end