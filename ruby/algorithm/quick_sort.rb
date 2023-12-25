def quick_sort(arr)
  return arr if arr.size <= 1

  pivot = arr.pop
  p pivot
  left, right = arr.partition { |num| num < pivot }

  quick_sort(left) + [pivot] + quick_sort(right)
end

arr = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
sorted_arr = quick_sort(arr)
puts sorted_arr #=> [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]
