# frozen_string_literal: true

require './professor'
require './lecture'
require './grade_lecture'
require './formatted_grade_lecture'

def main
  professor =
    Professor.new(
      '다익스트라',
      Lecture.new('알고리즘', 70, [81, 95, 75, 50, 45])
    )

#  p professor.compile_statistics
  p GradeLecture.new('알고리즘', 70, [81, 95, 75, 50, 45]).evaluate
  p FormattedGradeLecture.new('알고리즘', 70, [81, 95, 75, 50, 45]).format_average
end

main
