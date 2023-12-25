#!/bin/bash

# -----------------------------------------------
# 参考ページ
# -----------------------------------------------
# https://atmarkit.itmedia.co.jp/ait/articles/2002/14/news016.html

# -----------------------------------------------
# すること
# -----------------------------------------------
# fileを探すコード追加
# Renderedコード削除, CACHEも
# startedコードが入っていると止める
# startedコードが入っていると止める
# logを綺麗にまとめる 1回done
# --color=WHEN追加
# Render削除 Startedからスタート
# 行まだフォマット統一

line=250

# 使い方説明証
usage() {
  echo "$0 -m MODE[,MODE,...] [-u USER -f -q -v -d -g -h]"
  echo "<options>"
  echo "  -l : 表示したいLINE行数を入力してください"
  echo "  -u : ユーザーが作成したLogのみ表示します。ログは{}に囲んでください"
  echo "  -h : helpメッセージを表示する"
#  echo "    -m MODE[,MODE,...]:"
#  echo "           : MODE is 'GET' or 'SET' or 'SHOW'" echo "             If MODE is GET, get Info." echo "             If MODE is SET, set Info."
#  echo "             If MODE is SHOW, show Info"
#  echo "    -u USER: user name usging logging. default is 'unknown'"
#  echo "    -q     : Optional. Quiet mode"
#  echo "    -v     : Optional. Verbose mode"
#  echo "    -d     : Optional. print debug message"
#  echo "    -g     : Optional. No logging to syslog"
#  echo "<exit code>"
#  echo "    0: Success."
#  echo "    1: Failure."
  exit 1
}

basic_log() {
  echo 'basic_log'
  tail -n 250 log/development.log | \
  grep -A 250 'Started' | grep -v 'Rendered' | grep -v 'CACHE' | grep -v 'html_erb'
  tail -n 250 log/development.log | grep -A 250 'Started' | grep -v 'Rendered' | grep -v 'CACHE' | grep -v 'html_erb'
}

only_user_command() {
  tail -n $line log/development.log | \
  grep -A $line 'Started' | grep -v 'Rendered' | grep -v 'CACHE' | grep -v 'html_erb' | grep '^{'

  exit 1
}

# awk部分どう修正していくか
clean_table_log() {
  # tail -n $line log/development.log | grep -A $line 'Started' | grep -v 'Rendered' | grep -v 'CACHE' | grep -v 'html_erb'
  tail -n 250 log/development.log | \
  grep -A 250 'Started' | \
  grep -v 'Rendered' | \
  grep -v 'CACHE' | \
  grep -v 'html_erb' | \
  grep -v 'caused' | \
  awk '{
    if ($2 ~ /Load/) {
      print($1 ": " $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25)     } else {
      print($0)
    }
  }'

  exit 1
}

echo 'hello'
basic_log
#실행 옵션 설정
# while getopts m:u:fqvdgh opts; do
while getopts m:l:fqvdghut opts; do
  case $opts in
  l) line=$OPTARG;;
  u) only_user_command;;
  t) clean_table_log;;
  h) usage;;
  \?) usage;;
  *) clean_log;;
  esac
done


# -----------------------------------------------
# 실행 옵션 확인 code
# -----------------------------------------------
# echo "O_MODES=${O_MODES}"
# echo "O_USER=${O_USER}"
# echo "O_FORCE=${O_FORCE}"
# echo "O_QUIET=${O_QUIET}"
# echo "O_VERBOSE=${O_VERBOSE}"
# echo "O_DEBUG=${O_DEBUG}"
# echo "O_SYSLOG=${O_SYSLOG}"
# echo "line=${line}"

# -----------------------------------------------
# test code
# -----------------------------------------------

# tail -n $1 log/development.log
# tail -n 100 log/development.log | grep --context=200 'Started' | grep --line-buffered -v 'Rendered'
# tail -n 500 log/development.log | grep -A 500 'Started' | grep -v 'Rendered' | grep -v 'CACHE'
# tail -n 500 log/development.log | grep -A 500 'Started' | grep -v 'Rendered' | grep -v 'CACHE' | grep -v 'html_erb'
# tail -n 500 log/development.log | grep -A 500 'Started' | grep -v 'Rendered' | grep -v 'CACHE' | grep -v 'html_erb' | grep '{'
# tail -n 500 log/development.log | grep -A 500 'Started' | grep -v 'Rendered' | grep -v 'CACHE' | grep -v 'html_erb' | grep -C 3 '^{'
# tail -n 500 log/development.log | grep -A 500 'Started' | grep -v 'Rendered' | grep -v 'CACHE' | grep -v 'html_erb' | grep '^{'
