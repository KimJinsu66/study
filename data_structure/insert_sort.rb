class Insert
  attr_reader :list

  def initialize(list)
    @list = list
  end

  def sort
    1.upto(list.length - 1) do |index|
      temp = list[index]
      last_index = list.length - 1

      (index - 1).downto(0) do |j_index|
        break if list[j_index] <= temp

        list[j_index + 1] = list[j_index]
        last_index = j_index
      end

      list[last_index] = temp
    end

    list
  end
end

p Insert.new([99, 42, 20, 15, 67, 43, 120]).sort
p Insert.new([100, 80, 60, 40, 20, 10, 1]).sort
