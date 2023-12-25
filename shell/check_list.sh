useage() {
  echo "$0 [-p, -s -h] 'word' "
  echo "<options>"
  echo "  -p : PJ始まる時にすることチェックリスト"
  echo "  -s : 締作業する時にすることチェックリスト"
  echo "  -y : 有給取得する時にすること"
  echo "  -h : 仕様書"
}

start_pj() {
  echo '*** PJ始まる時にすることチェックリスト***'
}

simesagyou() {
  echo '*** 振り返り締作業 ***'
}

yukyu() {
  echo '*** 有給休暇取得時に必要なこと ***'
}

while getopts pshy opts; do
  echo 'test'
  case $opts in
  p) start_pj;;
  s) simesagyou;;
  h) useage;;
  y) yukyu;;
  \?) useage;;
  *) echo 'error';;
  esac

  exit
done

useage
