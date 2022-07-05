def linear_search(array, search_value)
  array.each_with_index do |element, index|
    if element == search_value
      return index
    elsif element > search_value
      break
    end
  end

  return nil
end

p linear_search(Array.new(1000) { |index| index }, 100)
