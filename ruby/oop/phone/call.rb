# frozen_string_literal: true

# Description/Explanation of Call class
class Call
  def initialize
    @start_time = start_time
    @end_time = end_time
    @calls = []
  end

  def duration
    @start_time.to_i - @end_time.to_i
  end
end
