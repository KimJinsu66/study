#!/bin/sh

# -----------------------------------------------
# 言語を翻訳してくれるshell script
# translate-shellを利用する
# 事前にすること 「brew install translate-shell」 install
# fileに保存する
# basic_log
# -----------------------------------------------

usage() {
  echo "$0 [-k, -j, -e] 'word' "
  echo "<options>"
  echo "  -e : 英語 → 日本語、韓国語に翻訳 "
  echo "  -j : 日本語 → 英語、韓国語に翻訳 "
  echo "  -k : 韓国語 → 日本語、英語に翻訳 "
}

translate_english() {
  echo '---------English Translate---------------'
  echo ''

  echo $input_word | trans -t ja+ko -b -no-ansi -o translated_output.txt
  cat translated_output.txt
  file_read '日本語' '韓国語'

  echo ''
  echo '---------English finish---------------'
}

translate_japanese() {
  echo '---------Japanese Translate---------------'
  echo ''

  # trans -t en+ko -b $input_word
  echo $input_word | trans -t en+ko -b -no-ansi -o translated_output.txt
  cat translated_output.txt
  file_read '英語' '韓国語'

  echo ''
  echo '---------Japanese finish---------------'
}

translate_korean() {
  echo '---------Korean Translate---------------'
  echo ''

  #trans -t en+ja $input_word
  echo $input_word | trans -t en+ja -b -no-ansi -o translated_output.txt
  cat translated_output.txt
  file_read '英語' '日本語'

  echo ''
  echo '---------Korean finish---------------'
}

file_check() {
  FILE="translated_output.txt"

  have_file=''
  if [ -e $FILE ]; then
    have_file='true'
  else
    echo "File not exists. please create translated_output.txt file"

    have_file='false'
  fi

  return have_file
}

file_read () {
  index=0

  printf "\nKeyword: $input_word\n" >> './jinsu_verbose.md'

  while read line
  do
    if [ $index -eq '0' ] ; then
      printf "$1: $line\n" >> './jinsu_verbose.md'
    fi

    if [ $index -eq '1' ] ; then
      printf "$2: $line" >> './jinsu_verbose.md'
    fi

    index=$((index += 1))
  done < ./translated_output.txt
}

input_word=$2

while getopts kje opts; do
  case $opts in
  k) translate_korean;;
  j) translate_japanese;;
  e) translate_english;;
  \?) usage;;
  *) echo 'error';;
  esac
done

#have_file=`file_check`
#echo "戻り値=${have_file}"
#echo "-----------------"
#
#echo $have_file
#if "$have_file" == "true" ； then
#  exit 1
#fi
# trans en:ja $1 -no-ansi >> ~/Desktop/Jinsu/shell/shell/translated_words.txt
#word=trans en:ja $1 -no-ansi
#word >> ~/Desktop/Jinsu/shell/shell/translated_words.txt

# cat $1 | \
# grep -E 'describe | context | it' | \
# awk '{ if ( $1 ~ /describe/ ) { print("\n", $0) } else { print($0) }}'
