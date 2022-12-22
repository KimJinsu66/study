# SQL

## JOIN

### NATURAL JOIN

Join이 되는 테이블의 데이터 도메인과 칼럼명 칼럼값이 동일해야 하는 제약조건이 있다

```SQL
SELECT * FROM emp NATURAL JOIN dept;
```

### CROSS JOIN

한 쪽 테이블의 모든 행드로가 다른 테이블의 모든 행을 조인시키는 기능을 한다

A Table: 10rows
B Table: 14rows

10 X 14 = 140rows가 결과로 출력된다

테이들에게서 나올 수 있는 행의 모든 조합을 다 만들어 낼 수 있다:

