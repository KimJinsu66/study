seq 4 | awk '{print "mkdir " ($1%2 ? "odd_" : "even_") $1}' | bash
