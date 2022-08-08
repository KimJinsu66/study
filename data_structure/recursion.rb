def countdown(n)
  p n

  if n === 0
    return
  else
    countdown(n - 1)
  end
end

countdown(10)
