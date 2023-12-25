# frozen_string_literal: true

require './grade_lecture'

# Description/Explanation of GradeLecture class
class FormattedGradeLecture < GradeLecture
  def initialize(title, pass, scores)
    super
  end

  def format_average
    # average = public_method(:average).super_method.call

    "#{average} FormattedGradeLecture #{test}"
  end
end
