
lines = [
  '3 6',
  '1 2 -5',
  '3 2 1',
  '3 1 6',
  '2 3 -1',
  '2 1 5',
  '1 3 -6'
]

#lines = [
#  '3 2',
#  '1 2 10',
#  '2 3 27'
#]

#lines = [
#  '3 2',
#  '1 2 100',
#  '2 3 100'
#]
#
#lines = [
#  '3 2',
#  '3 1 -1',
#  '2 3 -6'
#]
lines = [
  '2 2',
  '1 2 -7',
  '2 1 7'
]
people_count, answers = lines[0].split(' ').map(&:to_i)

# keyは people_idにする
peoples = {}
comparison_informations = {}

answers.times do |answer_count|
  answer_people_id, target_people_id, different_age = lines[answer_count + 1].split(' ').map(&:to_i)

  p "{1} #{answer_people_id}, target_people_id #{target_people_id}, different_age: #{different_age}"

  # 1.まず上で回答をもらう
  #
  return p -1 if different_age > 99 || different_age < -99

  if peoples[target_people_id]
    p "target_people_id #{answer_people_id}"
    finded_answer = peoples[target_people_id][:answers].find { |a| a[:target_people_id] == answer_people_id }

    # if分returnされる？
    #
    p "peoples #{peoples}"
    p finded_answer
    p finded_answer && finded_answer[:different_age]
    p different_age
    return p '-1' if finded_answer && finded_answer[:different_age] != (-1 * different_age)
  end

  # 1block: 答えしたユーザーに回答を保存する(回答より、比較年齢が良いかも)
  peoples[answer_people_id] = { answers: [] } if peoples[answer_people_id].nil?

  peoples[answer_people_id][:answers].push({ target_people_id: target_people_id, different_age: different_age, is_relation: false })


  # 2block 比較された対象保存する
  comparison_informations[target_people_id] = [] if comparison_informations[target_people_id].nil?
  comparison_informations[target_people_id].push(answer_people_id)

  if comparison_informations[answer_people_id]
    comparison_informations[answer_people_id].each do |people_id|
      # 命名変更したい
      answer = peoples[people_id][:answers].find { |a| a[:target_people_id] == answer_people_id }

      p peoples[people_id][:answers]

      peoples[people_id][:answers].push(
        {
          target_people_id: target_people_id,
          different_age: (answer[:different_age] + different_age),
          is_relation: true
        }
      )
    end
  end
end

# 回答
p "回答前のPEOPLE #{peoples}"
p "回答前のcomparison_informations #{comparison_informations}"
result = peoples.values.map { |people| people[:answers] }.flatten.select { |a| a[:is_relation] && a[:different_age] }
p "回答: result #{result}"

if result.length.positive?
  p "in?"

  max_age = result.map { |a| a[:different_age] }.max

  if max_age.zero?
    age = result

    p peoples.values.map { |people| people[:answers] }.flatten.map { |a| a[:different_age] }.max
  else
    p max_age
  end
else
  result = peoples.values.map { |people| people[:answers] }.flatten.map { |a| a[:different_age] }
  p "{result} #{result}"
  min_age = result.min
  max_age = result.max

  min_age = min_age.negative? ? min_age * -1 : min_age
  max_age = max_age.negative? ? max_age * -1 : max_age

  min_age == max_age ? min_age : min_age + max_age
end
p "回答peoples #{result.max}"

#p "peoples #{peoples}"
#p "comparison_informations #{comparison_informations}"
