class Bubble
  def initialize(list)
    @list = list
    @list_length = list.length - 2
  end

  def sort
    while true do
      break if @list_length.negative?

      0.upto(@list_length) do |i|
        next unless @list[i] > @list[i + 1]

        tmp = @list[i]
        @list[i] = @list[i + 1]
        @list[i + 1] = tmp
      end

      @list_length -= 1
    end

    p @list
  end
end

Bubble.new([99, 42, 20, 15, 67, 43, 120]).sort
Bubble.new([100, 80, 60, 40, 20, 10, 1]).sort
