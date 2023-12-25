# frozen_string_literal: true

require './lecture'

# Description/Explanation of GradeLecture class
class GradeLecture < Lecture
  def initialize(title, pass, scores)
    super
  end

  def average
    return 'GradeLecture'
  end

  def evaluate
    "#{super} GradeLecture evaluate method"
  end

  def test
    "good"
  end
end
