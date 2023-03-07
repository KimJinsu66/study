# DB Table

## 파티션 테이블

- TODO


# PostgreSql

## 구조

Cluster

  |

Role, TableSpace, Database
                    |
                  Schema
                    | 
                  Objects

Objects(Tabl, Index, Function, etc)

## Table Space

```SQL
SELECT * FROM pg_tablespace;
```

## 参考

- https://blog.ex-em.com/1655?category=1010730

## 부분 범위 처리


## 엑세스조건 AND 필터 조건


## Oid

# 실행계획

# Index 설계에 중요한 점

## 가장 중요한 두가지(외워두자!)

1. 조건절에 사용하거나 자주사용하는 컬럼을 선정
2. = 조건으로 자주 조회하는 컬럼을 앞쪽에 둔다

## 그외 판단

- 수행 빈도
- 업무상 중요도
- 클러스터링 팩터
- 데이터 량
- DML부하(기존 인덱스 개수, 초당 DML발생량, 자주 갱신하는 컬럼 포함 여부 등)
- 저장 공간
- 인텍스 관리 비용 등

## 참고사이트

- [PGSQL실행계획](https://seungtaek-overflow.tistory.com/5#:~:text=PostgreSQL%EA%B3%BC%20MySQL%20%EB%AA%A8%EB%91%90%20EXPLAIN,%EB%AC%B8%EC%84%9C%EC%97%90%EC%84%9C%20%ED%99%95%EC%9D%B8%ED%95%A0%20%EC%88%98%20%EC%9E%88%EB%8B%A4.)

# 파티셔닝

> [지디넷코리아]근래에 많은 기업들의 데이터베이스가 대용량화 되면서 이를 효과적으로 관리할 수 있는 방안을 찾는 것이 관리자들의 주요 업무가 됐다. 
> 이를 위한 매우 효과적인 방안 가운데 하나가 파티셔닝이다.


## 참고사이트

- SQL튜닝 책 6.3 파티션을 활용한 DML 튜닝

