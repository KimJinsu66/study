class Professor
  def initialize(name, lecture)
    @name = name
    @lecture = lecture
  end

  def compile_statistics
    "Avg: #{@name}, #{@lecture.evaludate}, #{@lecture.average}"
  end
end
