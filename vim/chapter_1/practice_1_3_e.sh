seq 5 | awk '{print $1%2 ? "짝수":"홀수"}' | sort | uniq -c | awk '{print $2,$1}'
