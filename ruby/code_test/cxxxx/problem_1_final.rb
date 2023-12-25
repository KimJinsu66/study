# input
#

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
    222,
    250,
    500,
    530,
    650,
    700,
    800,
    801,
    805,
    810,
    830,
    850,
    870,
    900,
    1000
  ]
}

input = {
  "N": 10,
  "T": 5,
  "A": [
    1,
    3,
    5,
    8,
    10
  ]
}

def clone_human(input)
  kabe = input[:N]
  move_count = input[:T]
  start_line_numbers = input[:A]
  conflicts = []

  result_hash = {}
  start_line_numbers.each do |number|
    result_hash.store("#{number}".to_i, { function: '+' })
  end

  1.upto(move_count) do |count|
    conflicts = []

    result_hash.keys.sort.map do |start_line|
      moto_number = start_line

      start_line += result_hash[start_line][:function] == '+' ? 1 : -1

      if start_line.zero?
        start_line += 1
        result_hash[start_line][:function] = '+'
      elsif start_line > kabe
        puts "kabe in?"
        start_line -= 1
        result_hash[start_line][:function] = '-'
        start_line -= 1
      end

      if result_hash[start_line] && result_hash[moto_number][:function] != result_hash[start_line][moto_number]
        conflicts.push({ moto_number: moto_number, conflict_number: start_line })
      else
        result_hash[start_line] = result_hash[moto_number]
        if start_line != moto_number
          result_hash.delete(moto_number)
        end
      end
    end

    conflicts.each do |conflict|
      if conflicts.find { |c| conflict[:conflict_number] == c[:moto_number] }
        result_hash[conflict[:moto_number]][:function] = result_hash[conflict[:moto_number]][:function] == '+' ? '-' : '+'
      else
        result_hash[conflict[:moto_number]][:function] = result_hash[conflict[:moto_number]][:function] == '+' ? '-' : '+'

        result_hash[conflict[:conflict_number] - 1] = { function: result_hash[conflict[:conflict_number]][:function] == '+' ? '-' : '+'}
        result_hash.delete(conflict[:conflict_number])
      end
    end
  end

  { 'answers' => result_hash.keys.sort }
end

result = clone_human(input)
p result
p result == [5, 6, 7]



