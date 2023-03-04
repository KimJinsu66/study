useage() {
  echo "$0 [-p, -s -h] 'word' "
  echo "<options>"
  echo "  -p : PJ始まる時にすることチェックリスト"
  echo "  -s : 締作業する時にすることチェックリスト"
  echo "  -h : 仕様書"
}

start_pj() {
  echo '*** PJ始まる時にすることチェックリスト***'
  echo '① 見積もり完了したか'
  echo '② OBPM登録や締作業することカレンダーに入れる'
}

simesagyou() {
  echo '*** 振り返り締作業 ***'
  echo '① PD書変遷変更'
  echo '② 見積もり書更新'
  echo '③ 振り返り(注意1: Tryのところ次にためす項目は赤くする)'
}

while getopts pjh opts; do
  echo 'test'
  case $opts in
  p) start_pj;;
  s) simesagyou;;
  h) useage;;
  \?) useage;;
  *) echo 'error';;
  esac

  exit
done

useage
