
# Dummy Record 작성 방법

## Postgres에서 작성 방법

### generate_series 사용
```SQL
INSERT INTO
  table_name(
    id,
    참고 테이블 id,
    status,
    created_at,
    updated_at
  )
SELECT
  i,                                                 -- 生成されたiをidに指定
  28,                                                -- format('テスト%s', i), --文字列に連番として付与する
  (SELECT (random() * 10000)::INTEGER % 5  + i - i), --0～4のランダムな値を設定
  clock_timestamp(),
  clock_timestamp()
FROM
  generate_series(1000000, 1000100) AS i
;
```
