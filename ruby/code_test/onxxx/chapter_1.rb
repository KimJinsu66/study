#!/bin/ruby

require 'json'
require 'stringio'



#
# Complete the 'gainMaxValue' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY security_val
#  2. INTEGER k
#

def gainMaxValue(security_val, k)
    # Write your code here
    
    start_number = security_val.length % k
    
    start_number = k if start_number.zero?

    result = 0
    (start_number - 1).step(security_val.length - 1, k) do |index|
      puts "index: #{index}"
      result += security_val[index]
    end
      
    puts "security_val: #{security_val}"
    puts "k: #{k}"
    puts "result"
    
    result    
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

security_val_count = gets.strip.to_i

security_val = Array.new(security_val_count)

security_val_count.times do |i|
    security_val_item = gets.strip.to_i
    security_val[i] = security_val_item
end

k = gets.strip.to_i

result = gainMaxValue security_val, k

fptr.write result
fptr.write "\n"

fptr.close()


    result = initial_players[initial_players.length - rank]
    before_max_number =
      if rank == 1
        Float::INFINITY
      else
        initial_players[initial_players.length - rank + 1]
      end
    rank_max_number = result

    puts "before_max_number: #{before_max_number}"
    puts "rank_max_number: #{rank_max_number}"

    new_players.each do |new_player|
      if new_player > before_max_number
        rank_max_number = before_max_number
      end

      if new_player >= rank_max_number && new_player <= before_max_number
        rank_max_number = new_player
      end
      puts "rank_max: #{rank_max_number}"
      result += rank_max_number
    end


#!/bin/ruby

require 'json'
require 'stringio'


#
# Complete the 'gainMaxValue' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY security_val
#  2. INTEGER k
#

def gainMaxValue(security_val, k)
    # Write your code here    
    results = []
    0.upto(security_val.length - 1) do |starting_node|
      result = 0
      (starting_node).step(security_val.length - 1, k) do |index|
        result += security_val[index]
      end
      
      results << result
    end
    
      
    results.max    
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

security_val_count = gets.strip.to_i

security_val = Array.new(security_val_count)

security_val_count.times do |i|
    security_val_item = gets.strip.to_i
    security_val[i] = security_val_item
end

k = gets.strip.to_i

result = gainMaxValue security_val, k

fptr.write result
fptr.write "\n"

fptr.close()

