# SQL関連をまとめる

- (Postgres의 SQL 실행계획에 대해서 자세하게 나와 있음)[https://seunghyunson.tistory.com/20]
- (Slow Query를 찾는 방법, 해결방법에 대해서 나와있음)[https://hyperconnect.github.io/2020/08/31/improve-slow-query.html]

# SQL성능을 높이기 위해

- 필요한 최소 블록만 읽도록 쿼리를 작성한다
- 최적의 옵티마이징 팩터를 제공한다
- 필요하다면 옵티마이저 힌트를 사용해 최적의 액세스 경로로 유도한다

# 옵티마이징 팩터

## 전략적인 인덱스 구성

- 1000만 건중에서 특정 레코드를 빠르게 찾을 방법은 없다

## 데이터베이스가 제공하는 다양한 기능 활용

- 파티션, 클러스터, IOT, MV, Result Cache

## 옵티마이저 모드 설정
## 정확하고 안정적인 통계정보

## SQL 튜닝 팀에서 일하고 싶을 때 필요한 점

- 옵티마이저가 SQL을 파싱하고 통계정보를 활용해 실행계획을 생성하는 원리
- 옵티마이저 쿼리변환 원리를 바탕으로 실행계획을 분석하는 방법
- 옵티마이저 힌트를 이용해 실행계획을 제어하는 방법
- 옵티마이저 좋은 실행계획을 생성하도록 유도하기 ㅎ위한 효과적인 SQL 작성법
- 어플리케이션에서 SQL을 실행할 때 사용하는 프로그래밍 인터페이스
- SQL을 빠르게 처리할 수 있는 좋은 데이터 구조와 파티션/인덱스 설계
- 정확성과 안정성을 확보할 수 있는 통계정보 수집 정책

## Tableのindex確認

```SQL
SELECT * FROM pg_indexes WHERE tablename = 'table_name';
```

### LIMIT

LIMITを利用するともっと早くなる？と思ったがExplainとしては変わってなかった
もっと多めのレコードがある時には、効果があるかも


```SQL
EXPLAIN SELECT * FROM t WHERE "table_name" = 'customers' AND record_id IN (1, 3, 5);
EXPLAIN SELECT * FROM t WHERE "table_name" = 'customers' AND record_id IN (1, 3, 5) LIMIT 1;
```

### TODO 
- [ ] もっと多めのレコードをとってLIMITし、性能を確認する

## Selectivity確認

MySql version
```SQL
SELECT
  t.TABLE_SCHEMA,
  t.TABLE_NAME,
  s.INDEX_NAME,
  s.COLUMN_NAME,
  s.SEQ_IN_INDEX,
  ( SELECT MAX(SEQ_IN_INDEX)
    FROM INFORMATION_SCHEMA.STATISTICS s2
    WHERE s.TABLE_SCHEMA = s2.TABLE_SCHEMA
    AND s.TABLE_NAME = s2.TABLE_NAME
    AND s.INDEX_NAME = s2.INDEX_NAME
  ) AS `COLS_IN_INDEX`,
  s.CARDINALITY AS `CARD`,
  t.TABLE_ROWS AS `ROWS`,
  ROUND(((s.CARDINALITY / IFNULL(t.TABLE_ROWS, 0.01)) * 100), 2) AS `SEL %`
FROM INFORMATION_SCHEMA.STATISTICS s
  INNER JOIN INFORMATION_SCHEMA.TABLES t
    ON s.TABLE_SCHEMA = t.TABLE_SCHEMA
    AND s.TABLE_NAME = t.TABLE_NAME
WHERE t.TABLE_SCHEMA != 'mysql'
AND t.TABLE_ROWS > 10
AND s.CARDINALITY IS NOT NULL
AND (s.CARDINALITY / IFNULL(t.TABLE_ROWS, 0.01)) < 1.00
ORDER BY `SEL %`, TABLE_SCHEMA, TABLE_NAME;

#### Postgresql
```SQL
-- 카디날리티/SELECTIVITY(선택도)

SELECT COUNT(*) AS NDV, MAX(CNT) AS MAX_CARD, MIN(CNT) MN_CARD, AVG(CNT) AS AVG_CARD
 FROM (
   SELECT "table_name", record_id, COUNT(*) AS CNT FROM timelines
     WHERE ("table_name" IS NOT NULL OR record_id IS NOT NULL)
   GROUP BY "table_name", record_id
 ) as timlines;
```

## Physical read count

```SQL
-- Physical read count

SELECT datname, blks_read, blks_hit FROM pg_stat_database;
SELECT * FROM pg_statio_all_tables WHERE schemaname = 'public';
-- https://lets.postgresql.jp/documents/technical/statistics/2
```

```
**参考**
- https://gist.github.com/benders/114299


