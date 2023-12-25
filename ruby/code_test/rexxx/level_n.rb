
a = 1000 / 3
b = 1000 / 7
 c = 0 # 1000 / 18

d  = 1000 / 21
 e = 0 #1000 / (7 * 18)
f = 0 # 1000 / (3 * 18)


p "a: #{a}, b: #{b}, c: #{c}, d: #{d}, e: #{e}, f: #{f}"
first_result = 1000 - a - b - c + d + e + f

p first_result


# line = ['1, 9827498525324', '2', '3 7']
# line = ['73718 97237', '1', '690']
line = ['47222 82749', '8', '54 134 749 178 136 908 430 91']
line = ['349451451 614555370', '8', '435692 231582 32060 740815 255014 196629 872488 11787']
#line = ['1 1000000000000000000', '10', '48 84 96 56 10 99 5 66 31 45']
#
#line = ['45474 93541', '1', '813']
#line = ['32964 73489', '8', '587 438 510 939 833 762 770 795']
# 最初 %0かどうか確認する必要がある
# 計算ロジック実装
# 最後に全部足す



monster_levels = line[0].split(' ').map(&:to_i)
total_monsters_count = monster_levels[1] - monster_levels[0] + 1
p "{total_monsters_count}: #{total_monsters_count}"

can_attack_count = line[1].to_i
can_attack_levels = line[2].split(' ').map(&:to_i)
can_attack_levels_2 = line[2].split(' ').map(&:to_i)


can_attack_levels.dup.sort.each do |level|
  p level

  # メソッドに切り出す
  # ロジック再度確認
  can_attack_levels.select! { |level_b| level_b == level || !(level_b % level).zero? }
end

p can_attack_levels

result = total_monsters_count
can_attack_levels.each do |level|
  # range_start以上でmultipleの倍数となる最小の整数を求める
  min_multiple = monster_levels[0] + (level - monster_levels[0] % level) % level

  p "min_multiple #{min_multiple}"

  # range_end以下でmultipleの倍数となる最大の整数を求める
  max_multiple = monster_levels[1] - monster_levels[1] % level

  p "max_multiple #{max_multiple}"
  # multipleの倍数が何個あるかを求める
  count = (max_multiple - min_multiple) / level + 1
  p "count: #{count}"
  result -= count
end

2.upto(can_attack_count) do |number|
  can_attack_levels.combination(number).to_a.each do |combination_result|
    p combination_result
    new_number = combination_result.reduce(:*)

    # range_start以上でmultipleの倍数となる最小の整数を求める
    min_multiple = monster_levels[0] + (new_number - monster_levels[0] % new_number) % new_number

    p "min_multiple #{min_multiple}"

    # range_end以下でmultipleの倍数となる最大の整数を求める
    max_multiple = monster_levels[1] - monster_levels[1] % new_number

    p "max_multiple #{max_multiple}"
    # multipleの倍数が何個あるかを求める
    count = (max_multiple - min_multiple) / new_number + 1

    p "+するとき: #{total_monsters_count / combination_result.reduce(:*)}"

    result += count
  end
end

p "result: #{result}"
p "============================================="

p "10jo"
start_num = 10
end_num = 724
num_39 = end_num / 39 - start_num / 39
num_51 = end_num / 51 - start_num / 51
num_39_51 = end_num / (39 * 51 / 3) - start_num / (39 * 51 / 3)
result = end_num - start_num - num_39 - num_51 + num_39_51
puts result

p "============================================="

range_start = 10
range_end = 724
multiple = 51

# range_start以上でmultipleの倍数となる最小の整数を求める
min_multiple = range_start + (multiple - range_start % multiple) % multiple

p "min_multiple #{min_multiple}"

# range_end以下でmultipleの倍数となる最大の整数を求める
max_multiple = range_end - range_end % multiple

p "max_multiple #{max_multiple}"
# multipleの倍数が何個あるかを求める
count = (max_multiple - min_multiple) / multiple + 1

puts count
p range_end - range_start + 1 - count

p "================================================="

p "최대 공약수"

arr = [48, 84, 96, 56, 10, 99, 5, 66, 31, 45]

# 最大公約数を求める
p gcd = arr.inject(:gcd)

arr = [12, 18, 24, 36]
p gcd = arr.inject(:gcd)

p "==============================================chat GPT"

range = monster_levels[0]..monster_levels[1]

can_attack_levels.each do |n|
  next if n > range.last # 範囲の最大値を超えたらループを抜ける
  range_start = (range.first / n.to_f).ceil # 倍数の開始位置を算出する
  range_end = (range.last / n.to_f).floor # 倍数の終了位置を算出する
  (range_start..range_end).each do |m|
    range = range.reject { |i| i == n * m } # 倍数を除外する
  end
end

# 残った数の個数を出力する
puts range.size



p "========================================================="

p "monster_levels #{monster_levels}"
p "can_attack_count #{can_attack_count}"
p "can_attack_levels #{can_attack_levels}"


minimum_monster_level = monster_levels[0]
maximum_monster_level = monster_levels[1]
monster_all_levels = (monster_levels[0]..monster_levels[1]).to_a

before_result = monster_all_levels.select { |level| level >= 33184 and level <= 37667 and (level % 853).zero? }

p before_result
0.upto(can_attack_count - 1) do |i|
  p i
  before_conut = monster_all_levels.count
  monster_all_levels.reject! { |level| (level % can_attack_levels_2[i]).zero? }

  p "before, after: #{before_conut - monster_all_levels.count}"
  p monster_all_levels.count
end


p monster_all_levels.count
