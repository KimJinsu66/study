# frozen_string_literal: true

# Description/Explanation of Lecture class
class Lecture
  attr_reader :title, :pass, :scores

  def initialize(title, pass, scores)
    @title = title
    @pass = pass
    @scores = scores
  end

  def evaluate
    'evaluate method'
  end

  def average
    p "average ?"
    scores.sum / scores.length
  end
end
