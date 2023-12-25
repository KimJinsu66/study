def check_ensure
  test_n = 1
  raise StandardError
rescue StandardError => e
  p "error #{e}"
ensure
  p test_n
end

check_ensure
