# frozen_string_literal: true

# Description/Explanation of Professor class
class Professor
  def initialize(name, lecture)
    @name = name
    @lecture = lecture
  end

  def compile_statistics
    "Professor: #{@name}, #{@lecture.evaluate}, Avg: #{@lecture.average}"
  end
end
