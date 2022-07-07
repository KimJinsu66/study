require 'benchmark'

class BinarySearcher
  def initialize(array, search_value)
    @array = array.sort
    @search_value = search_value
    @index = find_center_index
    @count = 0
  end

  def search
    p "Index: #{search_index}, Count: #{@count}"
  end

  private

  def search_index
    basic_index = @index

    while true do
      return basic_index if @array[basic_index] == @search_value

      @count += 1

      if @array[basic_index] < @search_value
        @index += 1
        basic_index += divided_two_index
      else
        @index -= 1

        if @index < 0
          basic_index += divided_two_index
          next
        end

        basic_index -= divided_two_index
      end
    end
  end

  def find_center_index
    (@array.dup.length - 1) / 2
  end

  def divided_two_index
    @index /= 2
  end
end

Benchmark.bm do |x|
  x.report('binary search') do
    array = Array.new(1_000_000) { |index| index }.shuffle
    search_value = 3500
    BinarySearcher.new(array, search_value).search

    array = Array.new(3_023_000) { |index| index }.shuffle
    search_value = 4200
    BinarySearcher.new(array, search_value).search

    array = Array.new(5_467_323) { |index| index }.shuffle
    search_value = 2_001
    BinarySearcher.new(array, search_value).search

    array = Array.new(8767) { |index| index }.shuffle
    search_value = 6700
    BinarySearcher.new(array, search_value).search

    array = Array.new(130_232) { |index| index }.shuffle
    search_value = 48_623
    BinarySearcher.new(array, search_value).search
  end
end

Benchmark.bm do |x|
  x.report('binary search no shuffle') do
    array = Array.new(1_000_000) { |index| index }
    search_value = 3500
    BinarySearcher.new(array, search_value).search

    array = Array.new(3_023_000) { |index| index }
    search_value = 4200
    BinarySearcher.new(array, search_value).search

    array = Array.new(5_467_323) { |index| index }
    search_value = 2_001
    BinarySearcher.new(array, search_value).search

    array = Array.new(8767) { |index| index }
    search_value = 6700
    BinarySearcher.new(array, search_value).search

    array = Array.new(130_232) { |index| index }
    search_value = 48_623
    BinarySearcher.new(array, search_value).search
  end
end
