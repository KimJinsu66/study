require 'benchmark'

class LinearSearcher
  def initialize(array, search_value)
    @array = array
    @search_value = search_value
  end

  def search
    @array.each_with_index do |element, index|
      if element == @search_value
        return index
      elsif element > @search_value
        break
      end
    end
  end
end

array = Array.new(1_000_000) { |index| index }.shuffle
search_value = 3500
p LinearSearcher.new(array, search_value).search

Benchmark.bm do |x|
  x.report('linear search') do
    array = Array.new(1_000_000) { |index| index }.shuffle
    search_value = 3500
    LinearSearcher.new(array, search_value).search

    array = Array.new(3_023_000) { |index| index }.shuffle
    search_value = 4200
    LinearSearcher.new(array, search_value).search

    array = Array.new(5_467_323) { |index| index }.shuffle
    search_value = 5_467_323
    LinearSearcher.new(array, search_value).search

    array = Array.new(8767) { |index| index }.shuffle
    search_value = 6700
    LinearSearcher.new(array, search_value).search

    array = Array.new(130_232) { |index| index }.shuffle
    search_value = 48_623
    LinearSearcher.new(array, search_value).search
  end
end

Benchmark.bm do |x|
  x.report('linear search no suffule') do
    array = Array.new(1_000_000) { |index| index }
    search_value = 3500
    LinearSearcher.new(array, search_value).search

    array = Array.new(3_023_000) { |index| index }
    search_value = 2_023_000
    LinearSearcher.new(array, search_value).search

    array = Array.new(5_467_323) { |index| index }
    search_value = 5_467_323
    LinearSearcher.new(array, search_value).search

    array = Array.new(8767) { |index| index }
    search_value = 6700
    LinearSearcher.new(array, search_value).search

    array = Array.new(130_232) { |index| index }
    search_value = 70_000
    LinearSearcher.new(array, search_value).search
  end
end
