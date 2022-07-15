require './professor'
require './lecture'

def main
  professor =
    Professor.new(
      '다익스트라',
      Lecture.new('알고리즘', 70, [81, 95, 75, 50, 45])
    )

  p professor.compile_statistics
end

main
