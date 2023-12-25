# 어딘가 회사에 코딩테스트 였는데 기억이 안남
# 그때 스레드와 프로세스를 사용해서 풀었는데, 알고리즘을 사용하지 않아서...

# Monsterのclassの方がよりOOPかも
class Monster
  def initialize(start_level, end_level)
    @start_level = start_level
    @end_level = end_level

    freeze
  end

  def attacks_list(level)
    p 'attack_levels'
    results = []
    start_level.upto(end_level) do |i|
      results << i if (i % level).zero?
    end

    results
  end

  private

  attr_reader :start_level, :end_level
end

def calculate(start_level, end_level, process_count)

  total_count = end_level - start_level + 1

  calculated_count = total_count / process_count

  results = [
    {
      start_level: start_level,
      end_level: start_level + calculated_count
    },
    {
      start_level: start_level + calculated_count + 1,
      end_level: (start_level + calculated_count + 1) + calculated_count
    },
    {
      start_level: start_level + calculated_count + 1 + calculated_count + 1,
      end_level: end_level
    }
  ]

  p results

  results
end

def process
  processes = []

  process_count = 3
  process_calculated_levels.each do |levels|
    attacker = Monster.new(levels[:start_level], levels[:end_level])

    processes << Process.fork do
      process_results = []
      attack_levels.each do |level|
        threads << Thread.new do
          process_results << attacker.attacks_list(level)
        end
      end

      threads.map(&:join)

      results << process_results
      p results
    end
  end

  Process.waitall # 全てのプロセスの終了を待つ
end

# スレッドで実行する処理を定義する

start_level = 10
end_level = 724

attack_levels = [7, 39, 51]

results = []
threads = []

process_count = 3
process_calculated_levels = calculate(start_level, end_level, process_count)

process_calculated_levels.each do |levels|
  attacker = Monster.new(levels[:start_level], levels[:end_level])

  attack_levels.each do |level|
    threads << Thread.new do
      results << attacker.attacks_list(level)
    end
  end

  p results
end

threads.map(&:join)
p results

result_count = results.flatten.uniq.count

p end_level - start_level + 1 - result_count
