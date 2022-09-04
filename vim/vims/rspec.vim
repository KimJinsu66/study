let s:current_line_number = line(".") + 1
echo s:current_line_number

while 1
  let s:current_line_number -= 1
  " echo s:current_line_number
  let s:current_line_text = getline(s:current_line_number)

  if match(s:current_line_text, 'describe') != -1
    let s:describe_line_number = s:current_line_number
    echo s:describe_line_number
    break
  endif
endwhile

echo "why?"
call s:RunRspec(s:describe_line_number)

function! s:RunRspec(line_number) abort
  let s:command = ":tab term ++shell sh ~/Desktop/vagrant/rspec.sh % {line_number}"

  let s:total_command =  substitute(s:command, "{line_number}", a:line_number, "g")

  execute s:total_command
endfunction
