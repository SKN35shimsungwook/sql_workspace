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

---

🤖 이 저장소의 README는 Claude Code와 함께 작성했어요.
