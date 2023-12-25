# PostgreSql

## pg_stats


## 容量監視

### ディスク容量測定

#### データベース領域
```SQL
SELECT pg_database_size('c'); -- データベース全体の容量
SELECT pg_relation_size('t'); -- テーブルやインデックスそれぞれの容量
SELECT pg_relation_size('n');
SELECT pg_total_relation_size('customers'); --インデックスのサイズを含むテーブルのサイズ

```

### メンテナンス

```SQL
pg_stats
SELECT * FROM pg_stats WHERE tablename = 'timelines' AND attname = 'table_name';

```


### パフォーマンス

- インデックス毎のアクセスに関する統計情報 → 使用されていないインデックスの特定可能
- idx_tup_read列は該当インデックスが利用された際に取得したエントリ数
- idx_tup_fetchはBitmpIndexScanとして利用された場合加算されない
- pg_stat_all_indexesとpg_statio_all_indexesの共通列が多いため、結合が容易
  – SELECT * FROM pg_stat_user_indexes NATURAL JOIN pg_statio_user_indexes LIMIT 1;

```SQL
SELECT 
  relid,        --テーブルのOID
  indexrelid,   --インデックスのOID
  schemaname,   --スキーマ名
  relname,      --テーブル名
  indexrelname, --インデックス名
  idx_scan,     --★インデックススキャンの実行回数
  idx_tup_read, --★読みとられたインデックス行数
  idx_tup_fetch --インデックススキャンで抽出された有効な行数
 FROM pg_stat_all_indexes WHERE schemaname = 'public';
```

### 参考サイト

- https://hayashier.com/article/postgresql-dba/
