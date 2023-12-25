#!/bin/bash

# -----------------------------------------------
# テストの describe, context, itのコンテキストを出力
# -----------------------------------------------

cat $1 | \
grep -E 'describe | context | it' | \
awk '{ if ( $1 ~ /describe/ ) { print("\n", $0) } else { print($0) }}'
