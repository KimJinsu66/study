class Screening
  def initialize
    @movie = movie
    @sequence = sequence
    @when_screened = when_screened
  end

  def start_time
    when_screened
  end

  def sequence?(other_sequence)
    @sequence == other_sequence
  end

  def movie_fee
    Movie.new.get_fee
  end
end
