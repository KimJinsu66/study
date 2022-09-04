
echo $1

file_name=$1
echo $file_name

model_file_name=~/DESKTOP/products/verdandi/app/models/$1.rb
spec_file_name=~/DESKTOP/products/verdandi/spec/models/$1_spec.rb
echo $model_file_name

echo "======= method list =============="
grep 'def' $model_file_name | sed -e "s/ .*def//" | sed -e "s/(.*//"
echo "======= end =============="


UNUSE_METHODS="1"
echo '=================== start ============================='
grep 'def' $model_file_name | sed -e "s/ .*def//" | sed -e "s/(.*//" | while read -r line;
do
  grep 'describe' $spec_file_name | grep -qE "\#$line|.$line" $spec_file_name

  if [ $? -eq "0" ]; then
    UNUSE_METHODS+="${line}1"
  else
    echo $line
  fi
done

echo '=================== end ============================='
echo $UNUSE_METHODS
echo "1"
