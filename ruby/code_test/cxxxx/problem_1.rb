# input

input = {
  "N": 1000,
  "T": 1000,
  "A": [
    1,
    3,
    8,
    30,
    50,
    100,
    200,
    201,
    202,
    203,
    204,
    210,
    211,
    212,
    213,
    220,
    222,
    231,
    250,
    251,
    255,
    330,
    455,
    480,
    500,
    530,
    580,
    630,
    650,
    700,
    740,
    760,
    800,
    801,
    803,
    805,
    808,
    810,
    820,
    830,
    850,
    880,
    870,
    890,
    900,
    1000
  ]
}

# test case 2
input = {
  "N": 10,
  "T": 12,
  "A": [
    1,
    3,
    5,
    8,
    10
  ]
}
#
input = {
  "N": 10,
  "T": 15,
  "A": [
    1,
    3,
    8
  ]
}

input = {
  "N": 4,
  "T": 10,
  "A": [
    1,
    2,
    3,
    4,
    5
  ]
}

def clone_human(input)
  start_time = Time.now
  kabe = input[:N]
  move_count = input[:T]
  start_line_numbers = input[:A]
  conflicts = []

  result_hash = {}
  start_line_numbers.each do |number|
    result_hash.store("#{number}".to_i, { function: '+', move_count: 0 })
  end

  p "numbers: #{result_hash}"

  1.upto(move_count) do |count|
    conflicts = []

    result_hash.keys.map do |start_line|
      moto_number = start_line

      # p "result_hash[start_line]: #{result_hash[start_line]}"

      start_line += result_hash[start_line][:function] == '+' ? 1 : -1

      if start_line.negative?
        start_line += 1
        result_hash[start_line][:function] = '+'
        start_line += 1
      elsif start_line > kabe
        start_line -= 1
        result_hash[start_line][:function] = '-'
        start_line -= 1
      end

      if result_hash[start_line] && result_hash[moto_number][:function] != result_hash[start_line][moto_number]
        if result_hash[start_line][:move_count] != result_hash[moto_number][:move_count]
          conflicts.push(
            {
              moto_number: moto_number,
              moto_hash: result_hash[moto_number],
              conflict_number: start_line,
              conflict_hash: result_hash[start_line],
              conflict_type: :moved
            }
          )

        else
          conflicts.push({ moto_number: moto_number, conflict_number: start_line, conflict_type: :not_moved })
        end
      else
        result_hash[start_line] = result_hash[moto_number]
        result_hash[start_line][:move_count] = count
        if start_line != moto_number
          result_hash.delete(moto_number)
        end
      end

      # puts "result_hash: #{result_hash}"
    end

    p "result_hash: #{result_hash}"
    conflicts.each do |conflict|

      # +だったら +1 -だったら -1
      # kkkkk

      if conflict[:conflict_type] == :moved
        if conflict[:moto_hash][:move_count] > conflict[:conflict_hash][:move_count]
          target_number = conflict[:moto_number]
          not_moved_number = conflict[:conflict_number]
        else
          target_number = conflict[:conflict_number]
          not_moved_number = conflict[:moto_number]
        end

        target_function = result_hash[target_number][:function]

        result_hash[target_number][:function] = target_function == '+' ? '-' : '+'

        back_number = target_number + (target_function == '+' ? -1 : 1)

        result_hash[back_number] = { function: target_function == '+' ? '-' : '+', move_count: count }
        result_hash.delete(target_number)

        result_hash[not_moved_number][:function] = result_hash[conflict[:moto_number]][:function] == '+' ? '-' : '+'
        result_hash[not_moved_number][:move_count] = count
      else
        result_hash[conflict[:moto_number]][:function] = result_hash[conflict[:moto_number]][:function] == '+' ? '-' : '+'
        result_hash[conflict[:moto_number]][:move_count] = count
      end
    end
  end

  end_time = Time.now

  puts "かかった時間: #{end_time - start_time}"

  { 'answer' => result_hash.keys.sort }
end

result = clone_human(input)
p result
p result == [5, 6, 7]


