# 🗄️ sql_workspace

MySQL을 공부하면서 정리한 **SQL 연습/학습 노트** 모음이에요. 실행 가능한 앱은 없고,
직접 실행하면서 익히는 순수 `.sql` 스크립트들이에요.

## 파일 구성

| 파일 | 내용 |
|---|---|
| `mySql1000_basic_sql.sql` | SQL 기초 — 데이터 타입, 대소문자 구분 규칙 등 |
| `mySql0002_function.sql` | SQL 함수 정리 — 단일행 함수(문자/숫자/날짜/변환/일반), 복수행 함수 |
| `mySql1000_musql.sql` | 데이터 딕셔너리(Data Dictionary) 개념 정리 |
| `mySql003_last.sql` | `WITH`절 / CTE(Common Table Expression) 정리 및 예제 |
| `emotion_diary.sql` | 실습용 예제 스키마 — 감정 일기 앱을 위한 `diaries` 테이블 생성 DDL |

## 기술 스택

- **MySQL** (8.0 이상 — `WITH`/CTE 구문을 사용하는 파일이 있어요)

## 사용하기

각 `.sql` 파일은 MySQL 클라이언트(Workbench, CLI 등)에서 그대로 열어서 위에서부터 순서대로
실행하며 따라가는 학습 노트예요.

```bash
mysql -u root -p < mySql0002_function.sql
```

## 자주 하는 실수 (노트에 정리된 주의사항)

이 저장소는 앱 코드가 아니라 SQL 학습 노트라서 "버그를 고친 기록"은 없어요. 대신 노트
안에 정리해 둔, **직접 겪었던 실수 포인트**를 옮겨왔어요.

**서브쿼리 안에 `ORDER BY`를 쓰면 에러**

- `mySql0002_function.sql`에 정리된 내용: 서브쿼리에서는 `ORDER BY`를 사용할 수 없음.
  `ORDER BY`절은 한 SQL문에 하나만 올 수 있어서, 항상 메인쿼리의 맨 마지막 문장에 와야 함.
  단일 행 비교 연산자(`=`, `>` 등)를 쓸 땐 서브쿼리 결과가 반드시 1건 이하여야 하고, 복수 행
  비교 연산자(`IN`, `ANY` 등)는 결과 건수와 상관없이 쓸 수 있다는 점도 헷갈리기 쉬운 부분.

**`WITH`절(CTE) 안에서 컬럼에 별칭을 다시 지정하면, 원래 컬럼명이 아니라 바뀐 이름을 써야 함**

- `mySql003_last.sql`에 반복적으로 남겨둔 메모: CTE에서 `AVG(score) AS jumsu`처럼 별칭을 주면,
  그 CTE를 참조하는 이후 쿼리에서는 `avg`가 아니라 `jumsu`로 불러야 함 — 원래 컬럼명을 그대로
  쓰면 존재하지 않는 컬럼이라는 에러가 남.

---

🤖 이 저장소의 README는 Claude Code와 함께 작성했어요.
