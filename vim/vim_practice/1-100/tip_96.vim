" :let swapper={"man":"dog", "dog":"man"}
" /\v(<dog>|<man>)
" :%s//\={"dog":"man", "man":"dog"}[submatch(1)]/
"

The man bit the dog.
