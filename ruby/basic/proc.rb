def proc_test

  proc_redirected_to = Proc.new { p 'test' }

  proc_redirected_to.call

end

proc_test
