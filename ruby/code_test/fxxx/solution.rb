
intervals = [[1,3], [2,4], [5,7]]

intervals = [[1,3],[1,3],[4,5]]

[1, 4] [5, 7]

[1, 3] [4, 5]

[[1, 2], [2, 3], [3, 4]]

def solution(intervals)
  result = intervals

  index = 0
  while result.length - 1 > index
    p "index: #{index}"
    p "result.length #{result.length}"

    if intervals[index][1] < intervals[index + 1][0]
      index += 1

      next
    end

    # 同じの場合: 合併
    added_array = intervals.shift + intervals.shift

    p "合併された配列 #{added_array}"

    sorted_array = added_array.sort

    result.unshift([added_array[0], added_array[added_array.length - 1]])

    p result
    p result.length
  end
end

solution(intervals)
