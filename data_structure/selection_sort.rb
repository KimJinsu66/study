class Selection
  def initialize(list)
    @list = list
    @list_length = list.length - 1
  end

  def sort
    while true do
      break if @list_length.negative?

      0.upto(@list.length - 1) do |first_loop_i|
        lowest_number_index = first_loop_i

        (first_loop_i + 1).upto(@list.length - 1) do |second_loop_i|
          if @list[second_loop_i] < @list[lowest_number_index]
            lowest_number_index = second_loop_i
          end
        end

        if lowest_number_index != first_loop_i
          tmp = @list[first_loop_i]
          @list[first_loop_i] = @list[lowest_number_index]
          @list[lowest_number_index] = tmp
        end
      end

      @list_length -= 1
    end

    p @list
  end
end

Selection.new([99, 42, 20, 15, 67, 43, 120]).sort
Selection.new([100, 80, 60, 40, 20, 10, 1]).sort
