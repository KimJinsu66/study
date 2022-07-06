class BinarySearch
  def initialize(array, search_value)
    @array = array.sort
    @search_value = search_value
    @index = find_center_index
  end

  def search
    p search_value
  end

  private

  def search_value
    index = @index
    count = 0

    while true do
      count += 1

      return index if @array[index] == @search_value

      if @array[index] < @search_value
        index += slice_half
      else
        index -= slice_half
      end
    end

    count
  end

  def find_center_index
    (@array.dup.length / 2) + 1
  end

  def slice_half
    @index = @index / 2
  end
end

BinarySearch.new(Array.new(1000) { |index| index }.shuffle, 243).search
